"""production hardening baseline

Revision ID: 20260504_0001
Revises:
Create Date: 2026-05-04
"""

from __future__ import annotations

import re
from pathlib import Path

from alembic import op

revision = "20260504_0001"
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    # Install extensions before schema DDL since schema.sql uses geography/vector types.
    # Wrapped in DO blocks so local dev without PostGIS/pgvector still works.
    op.execute("""
        DO $$ BEGIN
            CREATE EXTENSION IF NOT EXISTS pgcrypto;
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'pgcrypto unavailable: %', SQLERRM;
        END $$;
    """)
    op.execute("""
        DO $$ BEGIN
            CREATE EXTENSION IF NOT EXISTS postgis;
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'PostGIS unavailable — geography columns will be skipped: %', SQLERRM;
        END $$;
    """)
    op.execute("""
        DO $$ BEGIN
            CREATE EXTENSION IF NOT EXISTS vector;
        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'pgvector unavailable — RAG embedding column will be skipped: %', SQLERRM;
        END $$;
    """)

    schema_path = Path(__file__).resolve().parents[2] / "database" / "schema.sql"
    if schema_path.exists():
        bind = op.get_bind()
        # Check which extensions are available
        has_postgis = bind.execute(
            __import__("sqlalchemy").text("SELECT COUNT(*) FROM pg_extension WHERE extname = 'postgis'")
        ).scalar() > 0
        has_vector = bind.execute(
            __import__("sqlalchemy").text("SELECT COUNT(*) FROM pg_extension WHERE extname = 'vector'")
        ).scalar() > 0

        sql = schema_path.read_text(encoding="utf-8")

        import re
        # Remove raw CREATE EXTENSION lines from schema.sql since we handled them above
        sql = re.sub(r"CREATE EXTENSION IF NOT EXISTS postgis;?", "", sql, flags=re.IGNORECASE)
        sql = re.sub(r"CREATE EXTENSION IF NOT EXISTS pgcrypto;?", "", sql, flags=re.IGNORECASE)
        sql = re.sub(r"CREATE EXTENSION IF NOT EXISTS vector;?", "", sql, flags=re.IGNORECASE)

        if not has_postgis:
            # Remove GEOGRAPHY column definitions entirely (including trailing comma).
            sql = re.sub(r"\s+location GEOGRAPHY\(POINT,\s*4326\)[^,\n]*,?\n", "\n", sql)
            # Remove PostGIS trigger functions and triggers
            sql = re.sub(
                r"CREATE OR REPLACE FUNCTION set_(volunteer|incident|service)_location.*?LANGUAGE plpgsql;",
                "",
                sql,
                flags=re.DOTALL,
            )
            sql = re.sub(r"DROP TRIGGER IF EXISTS trg_\w+ ON \w+;", "", sql)
            sql = re.sub(r"CREATE TRIGGER trg_\w+.*?EXECUTE FUNCTION set_\w+\(\);", "", sql, flags=re.DOTALL)
            # Remove GIST indexes that require geography type
            sql = re.sub(r"CREATE INDEX IF NOT EXISTS idx_\w+_location ON \w+ USING GIST[^;]+;", "", sql)

        if not has_vector:
            # Replace vector column with TEXT fallback (or remove)
            sql = re.sub(r"\s+embedding vector\(768\)[^,\n]*,?\n", "\n", sql)
            # Remove ivfflat index
            sql = re.sub(r"CREATE INDEX IF NOT EXISTS idx_rag_chunks_embedding.*?\(lists = 100\);", "", sql, flags=re.DOTALL)

        # Execute the cleaned schema in a single pass (preserves DO $$ blocks)
        bind.exec_driver_sql(sql)

    op.execute(
        """
        CREATE TABLE IF NOT EXISTS user_private_profiles (
            user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
            key_id VARCHAR(80) NOT NULL,
            encrypted_payload TEXT NOT NULL,
            created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
            updated_at TIMESTAMPTZ
        )
        """
    )
    op.execute("CREATE INDEX IF NOT EXISTS idx_user_private_profiles_key ON user_private_profiles(key_id)")

    op.execute("ALTER TABLE background_jobs ADD COLUMN IF NOT EXISTS dedupe_key VARCHAR(160)")
    op.execute(
        """
        CREATE UNIQUE INDEX IF NOT EXISTS uq_background_jobs_dedupe_active
        ON background_jobs(dedupe_key)
        WHERE dedupe_key IS NOT NULL AND status IN ('pending', 'running')
        """
    )

    # Only run vector index if pgvector is available.
    op.execute("""
        DO $$ BEGIN
            IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'vector') THEN
                DROP INDEX IF EXISTS idx_rag_chunks_embedding;
                ALTER TABLE rag_chunks ALTER COLUMN embedding TYPE vector(768) USING NULL::vector(768);
                CREATE INDEX IF NOT EXISTS idx_rag_chunks_embedding
                    ON rag_chunks USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);
            END IF;
        END $$;
    """)

    op.execute(
        """
        DO $$
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_incidents_accepted_responder') THEN
                ALTER TABLE incidents
                ADD CONSTRAINT fk_incidents_accepted_responder
                FOREIGN KEY (accepted_responder_id) REFERENCES volunteers(id) ON DELETE SET NULL NOT VALID;
            END IF;
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_notification_logs_incident') THEN
                ALTER TABLE notification_logs
                ADD CONSTRAINT fk_notification_logs_incident
                FOREIGN KEY (incident_id) REFERENCES incidents(id) ON DELETE SET NULL NOT VALID;
            END IF;
        END $$;
        """
    )
    op.execute(
        """
        DO $$
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_service_reports_service') THEN
                ALTER TABLE service_reports
                ADD CONSTRAINT fk_service_reports_service
                FOREIGN KEY (service_id) REFERENCES emergency_services(id) ON DELETE SET NULL NOT VALID;
            END IF;
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_service_reports_reporter') THEN
                ALTER TABLE service_reports
                ADD CONSTRAINT fk_service_reports_reporter
                FOREIGN KEY (reporter_user_id) REFERENCES users(id) ON DELETE SET NULL NOT VALID;
            END IF;
        END $$;
        """
    )

    op.execute(
        """
        DO $$
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'ck_users_role') THEN
                ALTER TABLE users
                ADD CONSTRAINT ck_users_role
                CHECK (role IN ('user', 'volunteer', 'dispatcher', 'judge', 'admin')) NOT VALID;
            END IF;
            IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'ck_background_jobs_status') THEN
                ALTER TABLE background_jobs
                ADD CONSTRAINT ck_background_jobs_status
                CHECK (status IN ('pending', 'running', 'succeeded', 'failed')) NOT VALID;
            END IF;
        END $$;
        """
    )


def downgrade() -> None:
    op.execute("DROP INDEX IF EXISTS uq_background_jobs_dedupe_active")
    op.execute("ALTER TABLE background_jobs DROP COLUMN IF EXISTS dedupe_key")
    op.execute("DROP TABLE IF EXISTS user_private_profiles")
    op.execute("DROP INDEX IF EXISTS idx_rag_chunks_embedding")
    op.execute("ALTER TABLE rag_chunks ALTER COLUMN embedding TYPE vector(384) USING NULL::vector(384)")
    op.execute(
        """
        CREATE INDEX IF NOT EXISTS idx_rag_chunks_embedding
        ON rag_chunks USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100)
        """
    )
