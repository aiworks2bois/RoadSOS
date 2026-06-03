# RoadSoS Flutter — Product Requirements Document (PRD)

Version: 1.0 | Date: June 2026 | Status: Draft for Engineering

---

## 1. Product Vision

> RoadSoS is the last app a driver ever needs to open. One tap triggers a chain of deterministic, life-saving responses — no internet required, no LLM delays on the critical path, no waiting for a dispatcher to wake up.

The Flutter app is the **primary human interface** to the backend. It must be so fast, so reliable, and so obvious that a person in shock can operate it.

---

## 2. User Personas

### P1 — Victim / Distressed Motorist
- Just been in a crash or breakdown
- May be injured, panicking, phone battery low
- Needs: one-tap SOS, clear action steps, visible help ETA
- Device: mid-range Android (Redmi, Realme), sometimes iOS
- Connectivity: may have 2G only, or zero signal

### P2 — Registered Volunteer
- First-aid trained citizen or off-duty medic
- Keeps app running in background during commute
- Needs: push dispatch alert, navigation to victim, one-tap accept
- Constraint: cannot have app drain battery while waiting

### P3 — Dispatcher / Judge
- Control room operator monitoring active incidents
- Needs: real-time dashboard, incident timeline, escalation visibility
- Device: tablet preferred, but must work on phone
- Connectivity: always online

### P4 — Admin
- Backend operator, data team
- Needs: RAG ingestion UI, service data import, bootstrap
- Device: desktop browser preferred, but Flutter admin panel ships too

### P5 — Bystander
- Witnessed crash, not a registered user
- Needs: report-only mode (no account required for P1 triage report)

---

## 3. Feature Priority Matrix

### P0 — Must Ship in MVP (v1.0)

#### F-001: SOS Trigger
- **What**: Full-screen red button. One tap = POST /emergency/bundle + local triage begins simultaneously.
- **AC**:
  - [ ] Button visible in < 2 taps from any screen
  - [ ] Local GPS acquired in ≤ 3 s (show last-known if unavailable)
  - [ ] Response renders Golden Hour Bundle within 5 s on LTE
  - [ ] Offline: local triage + offline-services cache used, queued for upload
  - [ ] Auto-detect: accelerometer > 8G triggers confirmation dialog
  - [ ] Silent SOS: shake 3× triggers without opening app
  - [ ] Voice SOS: hold button 2 s → record → transcribe → trigger

#### F-002: Golden Hour Bundle Display
- **What**: Full-screen results after SOS. Severity badge, risk score, action plan steps, nearby services list.
- **AC**:
  - [ ] Action plan steps are numbered, large font (min 18sp), high contrast
  - [ ] Each service shows distance, trust score badge, one-tap call
  - [ ] Risk score renders as animated ring (0–1 mapped to green→red)
  - [ ] Country emergency fallback numbers always visible at bottom
  - [ ] Screen stays awake (WakeLock) while active

#### F-003: Live Incident Tracking
- **What**: Map view + status timeline while incident is open. Receives WebSocket events.
- **AC**:
  - [ ] WebSocket connects using JWT, reconnects on drop (≤ 5 s)
  - [ ] Responder pin appears when volunteer accepts
  - [ ] ETA countdown visible
  - [ ] Escalation tier notifications shown inline ("Escalated to Tier 2 — widening search")
  - [ ] Victim can resolve/cancel incident from this screen

#### F-004: JWT Authentication
- **What**: Login + Register screens. JWT stored in flutter_secure_storage.
- **AC**:
  - [ ] Biometric unlock option (local_auth)
  - [ ] Auto-refresh on 401 (if refresh endpoint added — see Backend Issues §8)
  - [ ] Role decoded from JWT claims, stored in Riverpod AuthState

#### F-005: Profile + Medical + Emergency Contacts
- **What**: User settings, encrypted medical profile, emergency contacts.
- **AC**:
  - [ ] Medical fields (blood type, allergies, conditions) stored via PATCH /users/me
  - [ ] Emergency contacts synced to backend private profile
  - [ ] FCM device token registered on login via POST /users/me/device-token

#### F-006: Helper Bot
- **What**: Chat UI posting to POST /helper/query with rate-limit awareness.
- **AC**:
  - [ ] Rate limit (20 req/min) shown with countdown timer to user
  - [ ] Emergency keywords in user message trigger inline SOS prompt before API call
  - [ ] Citations displayed as expandable source cards beneath answer
  - [ ] Safety notice pinned at top when present
  - [ ] Location optionally attached (user toggle)

#### F-007: Offline Services Map
- **What**: Pre-fetched nearby hospitals, police, towing via GET /sos/offline-services.
- **AC**:
  - [ ] Cache refreshed on app foreground + location change > 5 km
  - [ ] Renders on flutter_map with no internet
  - [ ] Each pin shows trust score colour (green/amber/red)

### P1 — Ship in v1.1

#### F-008: Volunteer Dispatch Flow
- Push notification received → accept/decline screen → navigation to victim.
- POST /volunteers/incidents/{id}/respond with action: "accept"/"decline".
- Foreground service sends live location to POST /sos/incidents/{id}/location.

#### F-009: Volunteer Availability Toggle
- Toggle in bottom nav or home widget. POST /volunteers/toggle-availability.
- Location streaming only starts when availability = true.

#### F-010: Dispatcher / Judge Dashboard
- Tabbed: Active Incidents | Metrics | Timeline.
- GET /dashboard/incidents/active → list with severity badges.
- GET /dashboard/metrics → counters with sparklines.
- WS /dashboard/ws → live incident feed, new incident toast.

#### F-011: Incident Deep Link (FCM)
- `data.incident_id` in FCM payload → GoRouter to /incidents/:id.
- Role-aware: victim → active_incident screen; volunteer → respond screen; dispatcher → dashboard detail.

### P1 — Ship in v1.2

#### F-012: Mesh Relay (BLE)
- Victim with no signal: advertise BLE packet (HMAC-signed compressed payload).
- Bystander device: scan, receive packet, relay via POST /emergency/mesh-relay on reconnect.
- UI: "Mesh SOS Sent — waiting for relay" state in offline_sos screen.

#### F-013: Voice SOS
- Long-press SOS button → 5 s recording → flutter_sound → base64 to /sos/trigger with incident_source=voice.
- On-device speech_to_text fallback if API unavailable.

#### F-014: SMS Fallback
- GET /sos/sms-fallback-payload → recipients + GPS message template.
- Auto-sends SMS using native channel when no internet + no BLE relay found.
- Android: SEND_SMS permission required. iOS: user must confirm in Messages app (no direct send on iOS).

#### F-015: Auto-Detect SOS (Sensor Fusion)
- Accelerometer (impact) + gyroscope (rollover) + barometer (if available).
- Threshold config from server (downloaded on init).
- 10 s countdown dialog post-detection → auto-trigger if not cancelled.

### P2 — v2.0

#### F-016: Localisation — Hindi + Marathi (hi, mr)
#### F-017: Offline Maps Tile Cache (flutter_map_tile_caching)
#### F-018: Admin Data Ingestion UI
#### F-019: Volunteer Ranking / Feedback Screen (POST /feedback/)
#### F-020: Bystander Report (unauthenticated, POST /data/services/report)

---

## 4. Non-Functional Requirements

| NFR | Target |
|-----|--------|
| SOS trigger → bundle rendered | ≤ 5 s on LTE |
| App cold start → home screen | ≤ 2 s |
| SOS button tap → local triage result | ≤ 200 ms |
| WebSocket reconnect after drop | ≤ 5 s |
| Offline services cache freshness | 30-min TTL |
| Memory usage (foreground) | ≤ 180 MB |
| Battery drain (background, no incident) | ≤ 2% / hour |
| Battery drain (active incident + location) | ≤ 8% / hour |
| Minimum Android API | 26 (Android 8.0) |
| Minimum iOS | 14.0 |
| APK size (release) | ≤ 35 MB |

---

## 5. SOS State Machine

```
IDLE
  │
  ├── [Tap / Shake / G-force detected]
  │
  ▼
ACQUIRING_LOCATION  (max 10 s, fallback to last-known)
  │
  ▼
TRIAGING            (local + remote in parallel)
  │
  ├── [No Internet] ──► OFFLINE_SOS
  │                       ├── BLE Advertise
  │                       └── SMS Send → PENDING_RELAY
  │
  ▼
BUNDLE_RECEIVED     (Golden Hour screen shown)
  │
  ▼
ACTIVE_INCIDENT     (WebSocket open, tracking live)
  │
  ├── [Tier escalations] → UI notifications
  ├── [Responder accepted] → show ETA + pin
  │
  ▼
RESOLVED / CANCELLED
```

---

## 6. Critical Edge Cases

| Edge Case | Handling |
|-----------|----------|
| GPS unavailable | Use IP geolocation → show "approximate location" banner |
| SOS during call | Continue SOS; don't interrupt call; notification channel used |
| JWT expired mid-incident | Silently refresh; WebSocket reconnects with new token |
| Backend down | Queue in offline_queue, retry every 30 s with exponential backoff |
| Low battery (< 15%) | Reduce location poll interval, disable BLE scanning |
| Multiple SOS from same user | Backend rate-limits at 3/min; UI shows "Incident already active" |
| App killed by OS mid-incident | background_locator foreground service survives; WebSocket resumes on reopen |
| Stale mesh relay packet | Backend rejects timestamp > 15 min; UI shows "Relay expired, retry" |
| 429 on SOS trigger | Show "Retrying in X seconds" — never silently fail |
| 503 from backend | Cache last-known bundle, show degraded banner, retry loop |

---

## 7. Success Metrics (v1.0)

| Metric | Target |
|--------|--------|
| SOS trigger → escalation confirmed | 100% within 10 s |
| Offline SOS relay success rate | > 80% when bystander within 50 m |
| Helper Bot DAU / total DAU | > 30% |
| Crash-free session rate | > 99.5% |
| P1 victim rates app ≥ 4 stars | > 75% |
| Play Store policy violations | 0 |
