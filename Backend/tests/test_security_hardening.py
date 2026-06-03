from __future__ import annotations

import base64
import hmac
import json
import time
from types import SimpleNamespace
from uuid import uuid4

import pytest
from fastapi import HTTPException
from starlette.requests import Request

from app.api.relay import _validated_payload_fields
from app.core.config import settings
from app.core.security import get_password_hash, verify_password
from app.main import _scrub_validation_errors
from app.services.cache import InMemoryCache
from app.services.offline_payload import generate_offline_payload
from app.services.rate_limiter import client_identifier, policy_for_path


def _request(client_host: str, forwarded_for: str | None = None) -> Request:
    headers = []
    if forwarded_for:
        headers.append((b"x-forwarded-for", forwarded_for.encode("ascii")))
    return Request(
        {
            "type": "http",
            "headers": headers,
            "client": (client_host, 12345),
            "server": ("testserver", 80),
            "scheme": "http",
            "method": "GET",
            "path": "/",
        }
    )


def test_password_hashing_does_not_truncate_after_72_bytes():
    password = "a" * 72 + "x"
    different_tail = "a" * 72 + "y"
    hashed = get_password_hash(password)

    assert verify_password(password, hashed)
    assert not verify_password(different_tail, hashed)


def test_rate_limiter_ignores_spoofed_forwarded_for_by_default(monkeypatch):
    monkeypatch.setattr(settings, "TRUST_PROXY_HEADERS", False)

    with_forwarded = client_identifier(_request("9.9.9.9", forwarded_for="1.2.3.4"))
    without_forwarded = client_identifier(_request("9.9.9.9"))

    assert with_forwarded == without_forwarded


def test_offline_payload_includes_valid_mesh_relay_signature():
    incident = SimpleNamespace(id=uuid4(), priority="P1_CRITICAL", lat=13.0067, lng=80.2206)
    before = int(time.time())
    payload = generate_offline_payload(incident, services=[], contacts=[])
    after = int(time.time())
    relay_packet = payload["relay_packet"]

    decoded = json.loads(base64.b64decode(relay_packet["payload_b64"], validate=True).decode("utf-8"))
    expected_signature = hmac.new(
        (settings.MESH_RELAY_SIGNING_KEY or settings.SECRET_KEY).encode("utf-8"),
        relay_packet["payload_b64"].encode("utf-8"),
        "sha256",
    ).hexdigest()

    assert decoded["i"] == str(incident.id)
    assert before <= decoded["t"] <= after
    assert hmac.compare_digest(expected_signature, relay_packet["signature"])


def test_bundle_endpoint_uses_sos_rate_limit_bucket():
    assert policy_for_path("/emergency/bundle").name == "sos"
    assert policy_for_path("/emergency/bundle").requests == settings.RATE_LIMIT_SOS_PER_MINUTE


def test_validation_errors_do_not_echo_sensitive_inputs():
    scrubbed = _scrub_validation_errors(
        [
            {
                "loc": ["body", "password"],
                "msg": "too short",
                "input": "super-secret-password",
                "ctx": {"nested": {"input": "bootstrap-token"}},
            }
        ]
    )

    assert "super-secret-password" not in str(scrubbed)
    assert "bootstrap-token" not in str(scrubbed)


async def test_cache_set_if_absent_prevents_duplicate_acceptance():
    cache = InMemoryCache()

    assert await cache.set_if_absent("mesh:replay:test", {"ok": True}, ttl_seconds=60)
    assert not await cache.set_if_absent("mesh:replay:test", {"ok": True}, ttl_seconds=60)


def test_mesh_payload_validation_rejects_expired_packets():
    payload = {
        "i": str(uuid4()),
        "p": "P1_CRITICAL",
        "l": [13.0067, 80.2206],
        "t": int(time.time()) - settings.MESH_RELAY_MAX_AGE_SECONDS - 1,
    }

    with pytest.raises(HTTPException):
        _validated_payload_fields(payload)
