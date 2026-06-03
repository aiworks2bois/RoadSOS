from __future__ import annotations

import base64
import hashlib
import hmac
import json
import logging
import time
from typing import Any, Dict
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field
from sqlalchemy import select, func
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.config import settings
from app.db.session import get_db
from app.models.incident import Incident, IncidentSource, IncidentStatus, PriorityEnum
from app.services.cache import cache
from app.services.task_queue import task_queue

logger = logging.getLogger(__name__)
router = APIRouter()

class MeshPacket(BaseModel):
    payload_b64: str = Field(..., min_length=8, max_length=12000)  # Base64 encoded JSON string
    signature: str = Field(..., min_length=64, max_length=64, pattern="^[0-9a-fA-F]{64}$")
    hops: int = Field(default=0, ge=0, le=12)


def _mesh_signing_key() -> str:
    return settings.MESH_RELAY_SIGNING_KEY or settings.SECRET_KEY


def _validated_payload_fields(payload: Dict[str, Any]) -> tuple[str, str | None, float, float, str | None]:
    location = payload.get("l")
    if not isinstance(location, (list, tuple)) or len(location) != 2:
        raise HTTPException(status_code=400, detail="Invalid mesh location")

    try:
        incident_id = str(UUID(str(payload.get("i"))))
        raw_user_id = payload.get("u")
        user_id = str(UUID(str(raw_user_id))) if raw_user_id else None
        lat = float(location[0])
        lng = float(location[1])
    except (TypeError, ValueError):
        raise HTTPException(status_code=400, detail="Invalid critical fields in mesh payload")

    if not (-90 <= lat <= 90 and -180 <= lng <= 180):
        raise HTTPException(status_code=400, detail="Invalid mesh coordinates")

    priority = payload.get("p")
    if priority is not None and priority not in {item.value for item in PriorityEnum}:
        raise HTTPException(status_code=400, detail="Invalid mesh priority")

    timestamp = payload.get("t")
    if timestamp is not None:
        try:
            emitted_at = int(timestamp)
        except (TypeError, ValueError):
            raise HTTPException(status_code=400, detail="Invalid mesh timestamp")
        now = int(time.time())
        max_age = max(300, settings.MESH_RELAY_MAX_AGE_SECONDS)
        if emitted_at < now - max_age or emitted_at > now + 300:
            raise HTTPException(status_code=400, detail="Expired mesh payload")

    return incident_id, user_id, lat, lng, priority


@router.post("/mesh-relay")
async def receive_mesh_relay(
    packet: MeshPacket,
    db: AsyncSession = Depends(get_db),
):
    """
    Mesh Relay Inbox.
    
    Accepts a compressed SOS packet forwarded by a peer device that has regained
    connectivity. Validates HMAC signature to prevent spam/abuse.
    """
    # 1. Verify Signature
    expected_sig = hmac.new(
        _mesh_signing_key().encode('utf-8'),
        packet.payload_b64.encode('utf-8'),
        hashlib.sha256
    ).hexdigest()

    signature = packet.signature.lower()
    if not hmac.compare_digest(expected_sig, signature):
        logger.warning("Invalid mesh packet signature")
        raise HTTPException(status_code=401, detail="Invalid mesh signature")

    # 2. Decode payload
    try:
        decoded_bytes = base64.b64decode(packet.payload_b64, validate=True)
        if len(decoded_bytes) > settings.MAX_MESH_PAYLOAD_BYTES:
            raise ValueError("mesh payload too large")
        payload: Dict[str, Any] = json.loads(decoded_bytes.decode('utf-8'))
    except Exception as e:
        logger.warning(f"Invalid mesh packet received: {e}")
        raise HTTPException(status_code=400, detail="Invalid compressed payload")
        
    incident_id, user_id, lat, lng, priority = _validated_payload_fields(payload)

    replay_ttl = max(300, settings.MESH_RELAY_MAX_AGE_SECONDS)
    replay_key = f"mesh:replay:{signature}"
    try:
        accepted = await cache.set_if_absent(
            replay_key,
            {"incident_id": incident_id, "accepted_at": int(time.time())},
            ttl_seconds=replay_ttl,
        )
    except Exception as exc:
        logger.warning("Mesh replay cache unavailable; continuing with queue dedupe: %s", exc)
    else:
        if not accepted:
            raise HTTPException(status_code=409, detail="Mesh packet already accepted")

    # Queue the escalation. We use dedupe_key so if 5 different mesh peers all regain 
    # connectivity and upload the exact same packet, we only process it once.
    dedupe_key = f"mesh_relay_{incident_id}_{signature}"
    
    await task_queue.enqueue(
        db,
        "process_mesh_relay",
        {
            "incident_id": incident_id,
            "user_id": user_id,
            "lat": lat,
            "lng": lng,
            "priority": priority,
            "hops": packet.hops
        },
        dedupe_key=dedupe_key,
        max_attempts=3
    )
    
    await db.commit()

    return {"status": "accepted", "message": "Mesh packet queued for processing"}


# Task queue handler for the mesh packet
async def handle_mesh_relay(payload: dict) -> None:
    """Task handler to process a mesh packet and ensure the incident exists."""
    incident_id = payload.get("incident_id")
    user_id = payload.get("user_id")
    lat = payload.get("lat")
    lng = payload.get("lng")
    priority_str = payload.get("priority") or "P1_CRITICAL"

    logger.info(
        "Processing mesh relay packet for incident %s (user %s) after %s hops.",
        incident_id,
        user_id or "unknown",
        payload.get("hops"),
    )
    
    from app.db.session import AsyncSessionLocal
    async with AsyncSessionLocal() as db:
        # 1. Check if the incident already exists (maybe another relay beat us to it)
        result = await db.execute(select(Incident).where(Incident.id == UUID(str(incident_id))))
        incident = result.scalar_one_or_none()
        
        if not incident:
            if not user_id:
                logger.warning(
                    "Mesh relay incident %s was not found and payload has no user id; skipping ghost creation.",
                    incident_id,
                )
                return
            logger.info("Creating ghost incident %s from mesh payload.", incident_id)
            try:
                priority_enum = PriorityEnum(priority_str)
            except ValueError:
                priority_enum = PriorityEnum.P1_CRITICAL

            incident = Incident(
                id=UUID(str(incident_id)),
                user_id=UUID(str(user_id)),
                description="OFFLINE SOS: Triggered via Mesh Relay (Bluetooth/SMS).",
                priority=priority_enum,
                source=IncidentSource.MANUAL,
                lat=lat,
                lng=lng,
                status=IncidentStatus.ACTIVE,
                metadata_json={"mesh_hops": payload.get("hops")}
            )
            db.add(incident)
            await db.flush()

        # 2. Trigger standard escalation
        await task_queue.enqueue_escalation(db, str(incident.id))
        await db.commit()

task_queue.register("process_mesh_relay", handle_mesh_relay)
