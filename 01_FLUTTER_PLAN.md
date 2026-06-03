# RoadSoS Flutter — Architecture & Project Plan

> Authored for a production-grade APK + iOS build targeting Android 8+ / iOS 14+.
> Backend: FastAPI on `https://api.roadsos.io` (configurable per flavor).

---

## 1. Core Philosophy

| Principle | Decision |
|-----------|----------|
| **Offline-first** | Every critical screen renders from local cache; network is enhancement, not requirement |
| **SOS is king** | The trigger button is reachable in ≤ 2 taps from any screen |
| **Role-aware** | Routing, UI, and data fetching adapt based on JWT role claim |
| **Deterministic UI** | No loading spinners on the SOS path — local triage begins immediately |
| **Battery respect** | Background location only runs when an active incident is live |

---

## 2. Tech Stack

### Core Framework
```
Flutter 3.22+      — Dart 3.4+, null safety, records & patterns
```

### State Management
```
Riverpod 2.x (code-gen)
```
Rationale: AsyncNotifierProvider handles the async-heavy WebSocket + API layer cleanly. Better than Bloc for this use case because incident state machines map naturally to StateNotifier. Avoids BLoC boilerplate for a team of 1-3.

### Navigation
```
go_router 13.x
```
Deep-link support for FCM notification taps (`/incidents/:id`). Role-based redirect guards at the router level.

### HTTP
```
dio 5.x + retrofit 4.x (code-gen)
```
Interceptor stack: JWT inject → retry on 401 (token refresh) → logging → error normalizer.

### WebSocket
```
web_socket_channel 3.x  (dart:io WebSocket under the hood)
```
Custom `IncidentSocketManager` with exponential-backoff reconnect (cap 30 s).

### Local Persistence
```
drift 2.x (SQLite, code-gen)       — structured incident/service cache
hive_flutter 2.x                   — lightweight key-value (JWT, settings, offline queue)
```

### Maps
```
flutter_map 6.x + latlong2         — OpenStreetMap tiles (no API key, works offline with tile cache)
```

### Push Notifications
```
firebase_messaging 15.x
flutter_local_notifications 17.x   — foreground & scheduled alerts
```

### Location
```
geolocator 12.x                    — one-shot + stream
background_locator_2 (Android foreground service)
```

### Bluetooth / Mesh Relay
```
flutter_blue_plus 1.x              — BLE scan + advertise for mesh relay packets
nearby_connections 3.x (optional)  — Google Nearby for higher bandwidth relay
```

### SMS Fallback
```
permission_handler 11.x
flutter_phone_direct_caller          — CALL_PHONE direct dial
send_sms (custom native channel)   — direct SMS without user confirmation (requires SEND_SMS perm)
```

### Audio / Voice SOS
```
flutter_sound 9.x                  — record WAV for Whisper transcription
speech_to_text 6.x                 — on-device fallback transcription
```

### Security
```
flutter_secure_storage 9.x         — AES-256 keystore for JWT tokens
encrypt 5.x                        — local medical data field encryption mirror
```

### Connectivity
```
connectivity_plus 5.x
```

### Utilities
```
crypto 3.x                         — HMAC-SHA256 for mesh relay signing
intl 0.19.x                        — localisation (en, hi, mr — Phase 2)
package_info_plus, device_info_plus
permission_handler 11.x
url_launcher 6.x
share_plus 8.x
```

---

## 3. Folder Structure (Feature-First)

```
lib/
├── main.dart                        # Flavor bootstrap
├── main_dev.dart
├── main_staging.dart
├── main_prod.dart
│
├── core/
│   ├── config/
│   │   ├── app_config.dart          # BaseUrl, flavor, feature flags
│   │   └── env.dart
│   ├── network/
│   │   ├── dio_client.dart          # Dio singleton + interceptors
│   │   ├── api_interceptor.dart     # JWT inject, 401 retry
│   │   ├── network_info.dart        # connectivity_plus wrapper
│   │   └── error_handler.dart       # ApiException normalizer
│   ├── auth/
│   │   ├── token_store.dart         # flutter_secure_storage wrapper
│   │   └── auth_notifier.dart       # login/logout/refresh state
│   ├── websocket/
│   │   ├── socket_manager.dart      # Base reconnect logic
│   │   ├── incident_socket.dart     # /sos/ws/{id}
│   │   └── dashboard_socket.dart   # /dashboard/ws
│   ├── location/
│   │   ├── location_service.dart   # geolocator wrapper
│   │   └── bg_location_service.dart # foreground service wrapper
│   ├── notifications/
│   │   ├── fcm_service.dart
│   │   └── local_notification_service.dart
│   ├── offline/
│   │   ├── offline_queue.dart       # hive-backed pending SOS queue
│   │   └── mesh_relay_encoder.dart  # HMAC-sign payload
│   ├── router/
│   │   ├── app_router.dart
│   │   ├── route_guards.dart        # role-based redirect
│   │   └── routes.dart              # route name constants
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── color_tokens.dart
│   │   └── text_styles.dart
│   └── utils/
│       ├── geohash.dart
│       ├── haversine.dart
│       └── extensions.dart
│
├── data/
│   ├── local/
│   │   ├── database.dart            # Drift DB definition
│   │   ├── dao/
│   │   │   ├── incident_dao.dart
│   │   │   ├── service_dao.dart
│   │   │   └── rag_cache_dao.dart
│   │   └── tables/
│   ├── remote/
│   │   ├── api/
│   │   │   ├── auth_api.dart
│   │   │   ├── sos_api.dart
│   │   │   ├── volunteer_api.dart
│   │   │   ├── helper_api.dart
│   │   │   ├── dashboard_api.dart
│   │   │   └── user_api.dart
│   │   └── models/               # Dart freezed response models
│   └── repositories/
│       ├── auth_repository.dart
│       ├── incident_repository.dart
│       ├── volunteer_repository.dart
│       ├── helper_repository.dart
│       └── service_repository.dart
│
└── features/
    ├── splash/
    ├── onboarding/
    ├── auth/
    │   ├── login/
    │   └── register/
    ├── home/                        # Role-dispatched shell
    ├── sos/
    │   ├── trigger/                 # The Big Red Button
    │   ├── bundle/                  # Golden Hour result display
    │   ├── active_incident/         # Live tracking screen
    │   └── offline_sos/             # No-internet SOS path
    ├── volunteer/
    │   ├── dashboard/
    │   ├── nearby_incidents/
    │   └── respond/
    ├── helper_bot/
    ├── profile/
    │   ├── medical/
    │   └── emergency_contacts/
    ├── services_map/
    ├── dispatcher/
    │   ├── dashboard/
    │   └── incident_detail/
    ├── settings/
    └── admin/
        ├── data_ingestion/
        └── rag_admin/
```

---

## 4. App Flavors

```dart
// flavors: dev | staging | prod
// configured via --dart-define=FLAVOR=prod

enum AppFlavor { dev, staging, prod }

class AppConfig {
  final String baseUrl;
  final String wsBaseUrl;
  final bool requireRedis;
  final bool enableMeshRelay;
  final bool enableVoiceSos;
}
```

Build commands:
```bash
# Android APK
flutter build apk --dart-define=FLAVOR=prod --release

# iOS IPA
flutter build ipa --dart-define=FLAVOR=prod --release

# Dev debug
flutter run --dart-define=FLAVOR=dev
```

---

## 5. Navigation Map (GoRouter)

```
/                         → Splash (token check → redirect)
/onboarding               → Onboarding (first install only)
/auth/login
/auth/register

# Authenticated shell (role-aware bottom nav)
/home
  /home/sos               → SOS Trigger (all roles)
  /home/map               → Services Map
  /home/helper            → Helper Bot
  /home/profile           → Profile

# SOS flow
/sos/bundle/:incidentId   → Golden Hour Bundle
/sos/active/:incidentId   → Live Tracking
/sos/offline              → Offline SOS flow

# Volunteer
/volunteer/dashboard
/volunteer/incident/:id/respond

# Dispatcher / Judge
/dispatcher/dashboard
/dispatcher/incident/:id

# Admin
/admin/ingestion
/admin/rag

# Notifications deep-link
/incidents/:id            → Resolved to active or dispatcher view by role
```

---

## 6. Screen Inventory by Role

| Screen | user | volunteer | dispatcher | judge | admin |
|--------|------|-----------|------------|-------|-------|
| SOS Trigger | ✅ | ✅ | ✅ | ✅ | ✅ |
| Golden Hour Bundle | ✅ | ✅ | — | — | — |
| Active Incident (victim) | ✅ | — | — | — | — |
| Volunteer Nearby Dispatch | — | ✅ | — | — | — |
| Volunteer Accept/Decline | — | ✅ | — | — | — |
| Helper Bot | ✅ | ✅ | ✅ | ✅ | ✅ |
| Services Map | ✅ | ✅ | ✅ | ✅ | ✅ |
| Dispatcher Dashboard | — | — | ✅ | ✅ | ✅ |
| Incident Timeline | — | — | ✅ | ✅ | ✅ |
| Data Ingestion | — | — | ✅ | — | ✅ |
| RAG Admin | — | — | — | — | ✅ |
| Profile / Medical | ✅ | ✅ | ✅ | ✅ | ✅ |

---

## 7. Key Data Models (Freezed)

```dart
@freezed
class SOSRequest with _$SOSRequest {
  const factory SOSRequest({
    required double latitude,
    required double longitude,
    String? description,
    double? impactForceG,
    bool? airbagDeployed,
    bool? rolloverDetected,
    required String incidentSource, // manual|auto_detect|voice|silent|bystander
    String? voiceTranscript,
  }) = _SOSRequest;
}

@freezed
class EmergencyBundle with _$EmergencyBundle {
  const factory EmergencyBundle({
    required String incidentId,
    required String severity,        // P1_CRITICAL ... P4_LOW
    required double confidenceScore,
    required double goldenHourRisk,
    required List<String> actionPlan,
    required List<NearbyService> nearbyServices,
    required OfflinePayload offlinePayload,
    required Map<String, String> countryFallbacks,
  }) = _EmergencyBundle;
}

@freezed
class IncidentSocketEvent with _$IncidentSocketEvent {
  const factory IncidentSocketEvent.locationUpdated(LatLng coords) = LocationUpdated;
  const factory IncidentSocketEvent.statusUpdated(String status) = StatusUpdated;
  const factory IncidentSocketEvent.tierEscalated(int tier) = TierEscalated;
  const factory IncidentSocketEvent.responderAccepted(String volunteerId) = ResponderAccepted;
}
```

---

## 8. Offline-First SOS Queue

When connectivity is unavailable at the moment of SOS trigger:
1. Triage is run **locally** using a Dart port of the classifier keyword banks (hardcoded in `core/offline/local_triage.dart`).
2. The SOS bundle is assembled locally with cached nearby services (from `/sos/offline-services` prefetch).
3. A signed offline payload is generated using `MESH_RELAY_SIGNING_KEY` (stored in secure storage, seeded at first login from server).
4. The payload is queued in Hive (`offline_queue`).
5. `connectivity_plus` listener fires the queue on reconnect.
6. Simultaneously, Bluetooth advertising begins so nearby devices can relay.

---

## 9. Phase Delivery Plan

| Phase | Scope | Target |
|-------|-------|--------|
| **MVP (v1.0)** | Auth, SOS trigger, Golden Hour bundle, live tracking WebSocket, Helper Bot, profile | 8 weeks |
| **v1.1** | Volunteer flow, dispatcher dashboard, FCM deep links, offline queue flush | +3 weeks |
| **v1.2** | Mesh relay (BLE), voice SOS, SMS fallback, medical profile encryption | +4 weeks |
| **v2.0** | Localisation (hi/mr), admin panels, OpenTelemetry, App Store submission | +6 weeks |
