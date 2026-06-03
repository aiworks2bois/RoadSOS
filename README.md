# RoadSoS Backend

RoadSoS is a high-performance, resilient FastAPI backend designed for road-emergency response. It matches users in distress with nearby volunteers and official emergency services, tracks dispatch updates via live WebSockets, handles offline "mesh relay" SOS packets, and provides grounded road-safety guidance through an AI Helper Bot.

**The Golden Rule**: **SOS is deterministic.** No LLM, GenAI, or RAG code runs in the `/sos/trigger` endpoint or the core escalation handlers. AI is exclusively used by the Helper Bot (with safe fallbacks) and optional voice transcription. The critical path remains fast, auditable, and 100% rules-based.

---

## 🏗️ Architecture & Core Components

RoadSoS is built for reliability under extreme conditions.

1.  **FastAPI & SQLAlchemy (Async)**: High-concurrency async event loop for handling thousands of concurrent WebSocket connections and API requests.
2.  **PostgreSQL + PostGIS + pgvector**: PostGIS handles fast geospatial queries (`ST_DWithin`, `ST_Distance`) for matching victims to responders. `pgvector` powers the Helper Bot's semantic search.
3.  **Durable Task Queue**: Database-backed (or Redis-backed) job queue for escalation. An active incident never blocks the main thread.
4.  **Notification Hub**: Unified interface for Firebase Cloud Messaging (FCM) push alerts and Twilio SMS fallbacks, with connection pooling.
5.  **WebSocket Manager**: Real-time pub/sub for incident updates, live location tracking, and dispatcher dashboard streaming.

---

## 🚨 The SOS Dispatch Lifecycle

When a user triggers an SOS, the system executes a precise, deterministic workflow.

### 1. Deterministic Triage (`classifier.py`)
The system analyzes the payload (description, impact force, airbag deployment, rollover sensors) against hardcoded term banks:
*   **`P1_CRITICAL`**: Life threat (e.g., "unconscious", "not breathing", "major bleeding", impact > 8G). ETA: 2-6 mins.
*   **`P2_HIGH`**: Serious injury/hazard (e.g., "head injury", "fuel leak", impact > 5G). ETA: 3-8 mins.
*   **`P3_MEDIUM`**: Minor injury/collision (e.g., "fender bender", "sprain"). ETA: 5-12 mins.
*   **`P4_LOW`**: Roadside assistance (e.g., "flat tire", "out of fuel"). ETA: 10-20 mins.
*   *Compound Critical Check*: Upgrades combinations like (Pedestrian Hit + Unresponsive) or (Fuel Leak + Fire) to P1.

### 2. The Golden Hour Bundle (`/emergency/bundle`)
Instead of a simple "SOS received" response, the API returns a comprehensive rescue bundle:
*   **Severity & Confidence**: The calculated priority.
*   **Golden Hour Risk Index**: A calculated risk score (0.0 to 1.0) based on severity and the distance to the nearest medical facility.
*   **Action Plan**: A sequential, step-by-step guide for the victim (e.g., "Do not move", "Prepare for ambulance arrival").
*   **Nearby Services**: Trust-scored hospitals, police, and towing services.
*   **Offline Payload**: A compact, HMAC-signed JSON packet for Mesh Relay.
*   **Country Fallbacks**: Local emergency numbers based on GPS coordinates.

### 3. Tiered Escalation (`escalation.py`)
Escalation runs as background jobs to ensure durability.
*   **Tier 0 (Immediate)**: Notifies personal emergency contacts and nearby registered volunteers. For `P1_CRITICAL`, official emergency services (Ambulance, Fire, Police) are notified immediately.
*   **Tier 1 (+90s)**: If unresolved, escalates P1/P2 incidents to official services if they weren't already notified.
*   **Tier 2 (+180s)**: Widens the search radius (up to 50km) and broadcasts to a larger pool of volunteers and services.
*   **Tier 3 (+300s)**: Triggers a persistent dashboard alert for human dispatchers and rebroadcasts until the incident is resolved or cancelled.

### 4. Live Tracking (`websocket_manager.py`)
*   Responders can accept the incident.
*   The victim's app sends `LiveLocationUpdate` packets.
*   WebSockets broadcast `location_updated`, `status_updated`, and `tier_escalated` events to responders and the dispatcher dashboard.

---

## 📡 Mesh Relay (Offline SOS)

For areas with no cell coverage, RoadSoS supports offline-first delivery.

1.  **Payload Generation**: The app generates a highly compressed JSON payload containing the victim's coordinates, priority, and medical info.
2.  **Signing**: The payload is HMAC-SHA256 signed using a shared secret (`MESH_RELAY_SIGNING_KEY`).
3.  **Transport**: The victim's phone transmits this packet via Bluetooth/Wi-Fi Direct to a passing vehicle or hiker.
4.  **Relay**: When the passing device regains internet access, it posts to `POST /emergency/mesh-relay`.
5.  **Verification**: The backend verifies the signature, coordinates, and timestamp (rejecting expired packets), prevents replays, and injects the "ghost" incident directly into the standard escalation queue.

---

## 🏥 Service Trust Scoring (`geo.py`)

When matching users with emergency services, the system doesn't just pick the closest one. It calculates an **Explainable Trust Score**:
*   **Verification (40%)**: Government APIs (1.0) > OpenStreetMap Verified (0.8) > Seed Data (0.6) > User Reports (0.5).
*   **Freshness (25%)**: Penalizes data that hasn't been updated recently.
*   **Distance (20%)**: Inverse penalty based on distance.
*   **Capacity (15%)**: Historical capacity or bed availability.

---

## 🚨 Mass Casualty Incident (MCI) Detection

RoadSoS automatically detects large-scale accidents (e.g., highway pileups).
1.  **Hot Path**: Groups high-priority (P1/P2/P3) incidents using **Geohash cells**.
2.  **Suppression**: If multiple SOS triggers occur in the same Geohash within a time window, the system suppresses duplicate dispatch alerts to prevent overwhelming local responders.
3.  **Verification**: Queues a background PostGIS `DBSCAN` job to verify the spatial density of the cluster.
4.  **Coordinator**: Promotes one user/incident to the "MCI Coordinator" for unified communication with dispatchers.

---

## 🤖 Helper Bot & RAG (`rag.py`)

A grounded AI assistant for non-critical road safety and first-aid queries.
*   **Emergency Override**: Every query is regex-scanned for life-threat keywords. If detected, the AI injects a hardcoded `SOS_FIRST_PREFIX` instructing the user to trigger SOS immediately.
*   **Hybrid Retrieval**: Combines Semantic Search (`pgvector`) and Keyword Search (PostgreSQL `ts_vector`), merged using **Reciprocal Rank Fusion (RRF)**.
*   **LLM Generation**: Feeds the context to an LLM (Gemini or Groq) to generate a conversational response.
*   **Extractive Fallback**: If LLM API keys are missing or the provider fails, it gracefully falls back to extracting and concatenating the raw markdown chunks from the database.

---

## 💻 Local Development Setup

We have configured the backend to run locally *without* Docker for ease of development on Windows. PostGIS columns have been patched to use standard `Text` columns, and geo-queries use pure SQL Haversine math.

### 1. Prerequisites
*   Python 3.11+
*   PostgreSQL (via Scoop or standard installer)

### 2. Environment Setup
```powershell
py -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Database Initialization
Ensure PostgreSQL is running on port 5432.
```powershell
# Create the database
psql -U postgres -c "CREATE DATABASE roadsos;"
```

### 4. Environment Variables
Copy `.env.example` to `.env`. Ensure list values are formatted as JSON arrays:
```env
ENVIRONMENT=development
DATABASE_URL=postgresql+asyncpg://postgres:postgres@localhost:5432/roadsos
SECRET_KEY=dev-secret-key-12345
CORS_ORIGINS=["http://localhost:3000","http://localhost:8080"]
ALLOWED_HOSTS=["*"]
```

### 5. Start the Server
```powershell
# Apply schema (the local dev schema has been adjusted for standard Postgres)
python -c "import app.main; print('import ok')" # Verify imports
uvicorn app.main:app --reload --port 8000
```
Visit **[http://localhost:8000/docs](http://localhost:8000/docs)** for the interactive Swagger API documentation.

### *Note on PostGIS (Production)*
The local development environment uses Haversine math fallbacks in `geo.py`. For staging/production, you **must** use a PostGIS-enabled PostgreSQL instance (like the one provided in the `docker-compose.yml`) and revert the fallback columns in `volunteer.py`, `incident.py`, and `service.py` back to `Geography(geometry_type="POINT", srid=4326)`.

---

## 🔒 Production Security Checklist

*   [ ] Use `postgresql+asyncpg://` for `DATABASE_URL`.
*   [ ] Set a 48+ character cryptographically secure `SECRET_KEY`.
*   [ ] Set a separate 48+ character `MESH_RELAY_SIGNING_KEY`.
*   [ ] Set `REQUIRE_REDIS_IN_PRODUCTION=true` and configure `REDIS_URL`.
*   [ ] Keep `TASK_QUEUE_BACKEND=database` or switch to Redis if preferred.
*   [ ] Define strict `CORS_ORIGINS` (no localhost or wildcards).
*   [ ] Provide `FIELD_ENCRYPTION_KEYS` for AES encryption of medical data.
*   [ ] Set `FCM_SERVICE_ACCOUNT_JSON` and Twilio credentials.

---

## 🗺️ API Endpoints Summary

### Authentication & Users
*   `POST /auth/register`: Register a new user.
*   `POST /auth/login`: Authenticate and receive JWT.
*   `GET /users/me`: Retrieve current user profile.

### Emergency & SOS
*   `POST /sos/trigger`: Standard SOS trigger.
*   `POST /emergency/bundle`: Golden Hour Rescue Engine (Triage + Action Plan).
*   `GET /sos/incidents/{id}`: Fetch incident status.
*   `POST /emergency/mesh-relay`: Ingest offline signed packet.
*   `GET /sos/offline-services`: Prefetch nearby emergency services for offline caching.

### Volunteers & Responders
*   `GET /volunteers/nearby`: Find nearby active volunteers.
*   `POST /volunteers/toggle-availability`: Go on/off duty.
*   `POST /volunteers/incidents/{id}/respond`: Accept an incident dispatch.

### Real-Time WebSockets
*   `WS /sos/ws/{incident_id}?token=JWT`: Stream live incident location and status updates.
*   `WS /dashboard/ws?token=JWT`: Global feed for dispatcher dashboards.

### Helper Bot
*   `POST /helper/query`: Ask the AI assistant road-safety questions.
