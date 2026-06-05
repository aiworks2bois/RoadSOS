from __future__ import annotations

import math
from typing import Any, Dict, List, Optional

from sqlalchemy import bindparam, text
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.config import settings
from app.services.cache import cache
from app.services.geohash import encode_geohash

# ---------------------------------------------------------------------------
# Haversine constants — used instead of PostGIS for local dev without PostGIS.
# PostGIS queries are commented below each function for production reference.
# ---------------------------------------------------------------------------
EARTH_RADIUS_M = 6_371_000  # metres


def _clamp_radius(radius_km: int) -> int:
    return max(1, min(radius_km, settings.MAX_RADIUS_KM))


def _haversine_m(lat1: float, lng1: float, lat2: float, lng2: float) -> float:
    """Great-circle distance in metres between two WGS-84 points."""
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    dphi = math.radians(lat2 - lat1)
    dlam = math.radians(lng2 - lng1)
    a = math.sin(dphi / 2) ** 2 + math.cos(phi1) * math.cos(phi2) * math.sin(dlam / 2) ** 2
    return 2 * EARTH_RADIUS_M * math.asin(math.sqrt(a))


async def find_nearby_volunteers(
    lat: float,
    lng: float,
    db: AsyncSession,
    radius_km: int | None = None,
    limit: int | None = None,
    required_skills: Optional[List[str]] = None,
) -> List[Dict]:
    """Haversine-based volunteer search ranked by distance, rating, recency, and skill match.

    Production note: Replace query with PostGIS ST_DWithin / ST_Distance when PostGIS is available.
    """
    radius_km = _clamp_radius(radius_km or settings.DEFAULT_RADIUS_KM)
    limit = min(limit or settings.MAX_VOLUNTEERS_RETURN, settings.MAX_VOLUNTEERS_RETURN)
    radius_meters = radius_km * 1000
    required_skills = required_skills or []

    # Haversine bounding-box pre-filter (lat/lng degree delta ≈ radius_km / 111)
    lat_delta = radius_km / 111.0
    lng_delta = radius_km / (111.0 * max(math.cos(math.radians(lat)), 0.001))

    query = text(
        """
        WITH ranked_volunteers AS (
            SELECT
                v.id,
                v.user_id,
                v.name,
                v.phone,
                v.rating,
                COALESCE(v.skills, ARRAY[]::text[]) AS skills,
                v.lat,
                v.lng,
                ST_Distance(
                    ST_SetSRID(ST_MakePoint(v.lng, v.lat), 4326)::geography,
                    ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography
                ) AS dist_m
            FROM volunteers v
            WHERE v.available = true
              AND v.lat IS NOT NULL
              AND ST_DWithin(
                  ST_SetSRID(ST_MakePoint(v.lng, v.lat), 4326)::geography,
                  ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography,
                  :radius_m
              )
        )
        SELECT 
            *,
            (
                -- Composite Score (higher is better):
                -- 1. Distance: Up to 50 points for being close (0m = 50, radius_m = 0)
                GREATEST(0, 50.0 * (1.0 - (dist_m / NULLIF(:radius_m, 0)))) +
                -- 2. Rating: Up to 30 points (5.0 stars = 30)
                COALESCE(rating, 4.0) * 6.0 +
                -- 3. Skills match: +20 points if they have required skills
                CASE WHEN ARRAY_LENGTH(:req_skills::text[], 1) > 0 AND skills && :req_skills::text[] THEN 20 ELSE 0 END
            ) AS rank_score
        FROM ranked_volunteers
        ORDER BY rank_score DESC, dist_m ASC
        LIMIT :limit
        """
    )
    
    result = await db.execute(
        query,
        {
            "lat": lat,
            "lng": lng,
            "radius_m": radius_meters,
            "req_skills": required_skills,
            "limit": limit,
        },
    )
    rows = result.mappings().all()

    # Python-side Haversine filter + scoring
    volunteers = []
    for row in rows:
        dist_m = float(row["dist_m"])
        distance_km = round(dist_m / 1000, 3)
        rating_score = min(max(float(row["rating"]) / 5.0, 0), 1)
        dist_score = max(0.0, 1 - dist_m / radius_meters)
        skill_match = 0.05 if (required_skills and set(required_skills) & set(row["skills"] or [])) else 0
        confidence_score = round(rating_score * 0.45 + dist_score * 0.35 + 0.05 + skill_match, 3)
        volunteers.append({**dict(row), "distance_km": distance_km, "confidence_score": confidence_score})

    volunteers.sort(key=lambda x: (-x["confidence_score"], x["distance_km"]))
    return volunteers[:limit]


async def find_nearby_services(
    lat: float,
    lng: float,
    db: AsyncSession,
    service_type: Optional[str] = None,
    types: Optional[List[str]] = None,
    radius_km: int | None = None,
    limit: int | None = None,
) -> List[Dict]:
    """Find nearby official emergency services using Haversine distance.

    Production note: Replace with PostGIS ST_DWithin / ST_Distance when PostGIS is available.
    """
    radius_km = _clamp_radius(radius_km or settings.SERVICE_RADIUS_KM)
    limit = min(limit or settings.MAX_VOLUNTEERS_RETURN, 20)
    radius_meters = radius_km * 1000

    type_values = [service_type] if service_type else list(types or [])
    type_values = [
        value.strip().upper()
        for value in type_values
        if isinstance(value, str) and value.strip() and value.strip().replace("_", "").isalnum()
    ]

    lat_delta = radius_km / 111.0
    lng_delta = radius_km / (111.0 * max(math.cos(math.radians(lat)), 0.001))

    params: dict[str, Any] = {
        "lat": lat, "lng": lng,
        "lat_min": lat - lat_delta, "lat_max": lat + lat_delta,
        "lng_min": lng - lng_delta, "lng_max": lng + lng_delta,
        "filter_types": bool(type_values),
        "types": type_values[:10] or ["__NO_SERVICE_TYPE__"],
    }

    query = text(
        """
        SELECT
          s.id,
          s.name,
          s.type,
          s.phone,
          s.lat,
          s.lng,
          s.capacity,
          s.source,
          s.confidence_score,
          s.updated_at,
          s.created_at,
          (
            2 * 6371000 * ASIN(SQRT(
              POWER(SIN(RADIANS(s.lat - :lat) / 2), 2) +
              COS(RADIANS(:lat)) * COS(RADIANS(s.lat)) *
              POWER(SIN(RADIANS(s.lng - :lng) / 2), 2)
            ))
          ) AS dist_m
        FROM emergency_services s
        WHERE s.is_active = true
          AND s.lat IS NOT NULL
          AND s.lat BETWEEN :lat_min AND :lat_max
          AND s.lng BETWEEN :lng_min AND :lng_max
          AND (:filter_types = false OR s.type IN :types)
        """
    ).bindparams(bindparam("types", expanding=True))

    result = await db.execute(query, params)
    rows = result.mappings().all()

    ranked_services = []
    for row in rows:
        dist_m = float(row["dist_m"])
        if dist_m > radius_meters:
            continue
        distance_km = round(dist_m / 1000, 2)
        d = dict(row)
        d["distance_km"] = distance_km

        # Scoring
        source = d["source"]
        score_verification = {"gov_api": 1.0, "osm_verified": 0.8, "user_report": 0.5, "seed": 0.6}.get(source, 0.4)
        score_freshness = max(0.0, 1.0)  # No updated_at in seed data; default fresh
        score_distance = max(0.0, 1.0 - dist_m / radius_meters)
        score_history = min(max((float(d.get("capacity") or 10) / 100.0), 0.1), 1.0)

        trust_score = (
            (0.40 * score_verification)
            + (0.25 * score_freshness)
            + (0.20 * score_distance)
            + (0.15 * score_history)
        )
        d["trust_score"] = round(trust_score, 3)

        reasons = []
        if source == "gov_api":
            reasons.append("Gov Verified")
        elif source == "osm_verified":
            reasons.append("OSM Verified")
        else:
            reasons.append("Community Sourced")
        if distance_km < 5.0:
            reasons.append(f"Nearby ({distance_km}km)")

        d["explainable_trust"] = f"{int(trust_score * 100)}% Trust — " + " + ".join(reasons)
        # Remove internal fields
        d.pop("dist_m", None)
        d.pop("updated_at", None)
        d.pop("created_at", None)
        ranked_services.append(d)

    ranked_services.sort(key=lambda x: (-x["trust_score"], x["distance_km"]))
    return ranked_services[:limit]


async def get_offline_services_prefetch(lat: float, lng: float, db: AsyncSession, precision: int = 6) -> Dict:
    """Cache nearby official services by geohash for offline Flutter fallback."""
    geohash = encode_geohash(lat, lng, precision=precision)
    cache_key = f"offline_services:{geohash}"
    cached = await cache.get(cache_key)
    if cached:
        return cached
    services = await find_nearby_services(lat, lng, db=db, radius_km=30, limit=20)
    payload = {"geohash": geohash, "services": services, "ttl_seconds": 86400}
    await cache.set(cache_key, payload, ttl_seconds=86400)
    return payload
