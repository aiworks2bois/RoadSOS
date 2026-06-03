# RoadSoS Flutter — Backend Integration Guide

> Hot-connection architecture, Android manifest, iOS plist, and every backend issue
> that will break the app if not addressed before production.

---

## 1. API Client Architecture (Dio)

```dart
// core/network/dio_client.dart

@riverpod
Dio dioClient(DioClientRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.current.baseUrl,       // https://api.roadsos.io
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 10),
    headers: {
      'Accept': 'application/json',
      'X-App-Version': PackageInfo.appVersion,
      'X-Platform': Platform.isAndroid ? 'android' : 'ios',
    },
  ));

  dio.interceptors.addAll([
    JwtInterceptor(ref),        // inject Bearer token
    RetryInterceptor(dio),      // retry on 401 (token refresh)
    ConnectivityInterceptor(),  // throw OfflineException early
    LogInterceptor(             // dev builds only
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => debugPrint('Dio: $obj'),
    ),
  ]);

  return dio;
}
```

### JWT Interceptor

```dart
class JwtInterceptor extends Interceptor {
  final Ref _ref;
  JwtInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _ref.read(tokenStoreProvider).getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // ⚠️  Backend Issue #1: No refresh token endpoint exists yet.
      // Currently: force re-login on 401.
      // Fix needed: see Backend Issues section.
      await _ref.read(authNotifierProvider.notifier).logout();
      return handler.reject(err);
    }
    handler.next(err);
  }
}
```

---

## 2. Retrofit API Definitions

```dart
// data/remote/api/sos_api.dart
@RestApi()
abstract class SosApi {
  factory SosApi(Dio dio) = _SosApi;

  @POST('/sos/trigger')
  Future<SOSResponse> trigger(@Body() SOSRequest request);

  @POST('/emergency/bundle')
  Future<EmergencyBundle> bundle(@Body() SOSRequest request);

  @GET('/sos/incidents/{id}')
  Future<IncidentOut> getIncident(@Path('id') String id);

  @PATCH('/sos/incidents/{id}/status')
  Future<IncidentOut> updateStatus(
    @Path('id') String id,
    @Body() Map<String, String> body,  // {"status": "resolved"}
  );

  @POST('/sos/incidents/{id}/location')
  Future<void> updateLocation(
    @Path('id') String id,
    @Body() LocationUpdate update,
  );

  @POST('/emergency/mesh-relay')
  Future<void> meshRelay(@Body() MeshRelayPayload payload);

  @GET('/sos/offline-services')
  Future<OfflineServicesResponse> offlineServices(
    @Query('lat') double lat,
    @Query('lng') double lng,
  );

  @GET('/sos/sms-fallback-payload')
  Future<SMSFallbackPayload> smsFallbackPayload();
}
```

---

## 3. WebSocket Manager

```dart
// core/websocket/incident_socket.dart

class IncidentSocketManager {
  WebSocketChannel? _channel;
  StreamController<IncidentSocketEvent> _eventController =
      StreamController.broadcast();
  
  Stream<IncidentSocketEvent> get events => _eventController.stream;
  
  bool _shouldReconnect = true;
  Duration _backoff = const Duration(seconds: 1);

  Future<void> connect({
    required String incidentId,
    required String jwt,
  }) async {
    _shouldReconnect = true;
    _connect(incidentId, jwt);
  }

  void _connect(String incidentId, String jwt) {
    // ⚠️  Backend Issue #2: Token in URL query param is insecure (logged in access logs).
    // Current workaround: use the query param as-is until backend adds header auth for WS.
    final uri = Uri.parse(
      '${AppConfig.current.wsBaseUrl}/sos/ws/$incidentId?token=$jwt'
    );

    _channel = WebSocketChannel.connect(uri);

    _channel!.stream.listen(
      (data) {
        final event = _parseEvent(data as String);
        if (event != null) _eventController.add(event);
        _backoff = const Duration(seconds: 1); // reset on successful message
      },
      onError: (error) => _scheduleReconnect(incidentId, jwt),
      onDone: () {
        if (_shouldReconnect) _scheduleReconnect(incidentId, jwt);
      },
    );
  }

  void _scheduleReconnect(String incidentId, String jwt) async {
    await Future.delayed(_backoff);
    _backoff = Duration(
      milliseconds: min(_backoff.inMilliseconds * 2, 30000)
    );
    if (_shouldReconnect) _connect(incidentId, jwt);
  }

  IncidentSocketEvent? _parseEvent(String raw) {
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return switch (json['type']) {
        'location_updated' => LocationUpdated(
            LatLng(json['lat'] as double, json['lng'] as double)),
        'status_updated'   => StatusUpdated(json['status'] as String),
        'tier_escalated'   => TierEscalated(json['tier'] as int),
        'responder_accepted' => ResponderAccepted(json['volunteer_id'] as String),
        _ => null,
      };
    } catch (_) { return null; }
  }

  void disconnect() {
    _shouldReconnect = false;
    _channel?.sink.close();
    _channel = null;
  }
}
```

---

## 4. FCM Integration

```dart
// core/notifications/fcm_service.dart

class FCMService {
  final Dio _dio;

  Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true, badge: true, sound: true,
      criticalAlert: true,  // iOS: required for emergency alerts through DND
    );

    // Register token with backend
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) await _registerToken(token);

    // Token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen(_registerToken);

    // Foreground messages
    FirebaseMessaging.onMessage.listen(_handleForeground);

    // Background / terminated tap
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedApp);

    // Terminated launch
    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) _handleOpenedApp(initial);
  }

  Future<void> _registerToken(String token) async {
    await _dio.post('/users/me/device-token', data: {'fcm_token': token});
  }

  void _handleForeground(RemoteMessage msg) {
    // Show local notification via flutter_local_notifications
    // Don't navigate automatically — user must tap
    LocalNotificationService.show(
      title: msg.notification?.title ?? 'RoadSoS Alert',
      body: msg.notification?.body ?? '',
      payload: jsonEncode(msg.data),
      channelId: _channelForType(msg.data['type']),
    );
  }

  void _handleOpenedApp(RemoteMessage msg) {
    final incidentId = msg.data['incident_id'];
    if (incidentId != null) {
      // Deep link into app
      AppRouter.router.push('/incidents/$incidentId');
    }
  }

  String _channelForType(String? type) => switch (type) {
    'SOS_DISPATCH' => 'sos_dispatch',
    'ESCALATION'   => 'escalation',
    _              => 'default',
  };
}
```

---

## 5. Android Manifest — Full Permissions

```xml
<!-- android/app/src/main/AndroidManifest.xml -->

<!-- ===== NETWORK ===== -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />

<!-- ===== LOCATION ===== -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<!-- Android 10+ — requires separate OS-level grant, guide user to settings -->
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

<!-- ===== FOREGROUND SERVICE ===== -->
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<!-- Android 14+ — must declare type -->
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" />

<!-- ===== BLUETOOTH (Mesh Relay) ===== -->
<!-- Legacy — API < 31 -->
<uses-permission android:name="android.permission.BLUETOOTH"
    android:maxSdkVersion="30" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"
    android:maxSdkVersion="30" />
<!-- Android 12+ (API 31+) -->
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />

<!-- ===== WIFI DIRECT (Mesh Relay fallback) ===== -->
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
<!-- Android 13+ -->
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"
    android:usesPermissionFlags="neverForLocation" />

<!-- ===== TELEPHONY / SMS FALLBACK ===== -->
<uses-permission android:name="android.permission.CALL_PHONE" />
<uses-permission android:name="android.permission.SEND_SMS" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />

<!-- ===== NOTIFICATIONS ===== -->
<!-- Android 13+ (API 33+) — runtime permission required -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<!-- Critical alerts (loud sound even in DND) -->
<uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />

<!-- ===== AUDIO / VOICE SOS ===== -->
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />

<!-- ===== CAMERA (Evidence capture) ===== -->
<uses-permission android:name="android.permission.CAMERA" />

<!-- ===== CONTACTS (Emergency contact import) ===== -->
<uses-permission android:name="android.permission.READ_CONTACTS" />

<!-- ===== SYSTEM ===== -->
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
<!-- Required for heads-up SOS dispatch over lock screen -->
<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />

<!-- ===== SERVICE DECLARATIONS ===== -->
<service
  android:name=".LocationForegroundService"
  android:foregroundServiceType="location"
  android:exported="false" />

<receiver
  android:name=".BootReceiver"
  android:exported="true">
  <intent-filter>
    <action android:name="android.intent.action.BOOT_COMPLETED" />
  </intent-filter>
</receiver>
```

---

## 6. iOS — Info.plist Keys

```xml
<!-- ios/Runner/Info.plist -->

<!-- Location -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>RoadSoS uses your location to send emergency responders to your position.</string>

<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>RoadSoS needs continuous background location during an active emergency to keep responders updated on your position.</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>RoadSoS needs continuous background location during an active emergency.</string>

<!-- Bluetooth -->
<key>NSBluetoothAlwaysUsageDescription</key>
<string>RoadSoS uses Bluetooth to relay emergency SOS signals to nearby devices when internet is unavailable.</string>

<key>NSBluetoothPeripheralUsageDescription</key>
<string>RoadSoS uses Bluetooth to relay SOS signals offline.</string>

<!-- Microphone -->
<key>NSMicrophoneUsageDescription</key>
<string>RoadSoS uses the microphone for Voice SOS — describe your emergency by speaking.</string>

<!-- Camera -->
<key>NSCameraUsageDescription</key>
<string>RoadSoS uses the camera to capture incident photos for emergency responders.</string>

<!-- Contacts -->
<key>NSContactsUsageDescription</key>
<string>RoadSoS uses your contacts to set up emergency contact notifications.</string>

<!-- Background Modes -->
<key>UIBackgroundModes</key>
<array>
  <string>location</string>
  <string>fetch</string>
  <string>remote-notification</string>
  <string>voip</string>                <!-- For PushKit volunteer dispatch -->
  <string>bluetooth-central</string>
  <string>bluetooth-peripheral</string>
</array>

<!-- Local Network (for mesh relay on local WiFi) -->
<key>NSLocalNetworkUsageDescription</key>
<string>RoadSoS uses the local network to relay SOS signals to nearby devices.</string>
<key>NSBonjourServices</key>
<array>
  <string>_roadsos._tcp</string>
</array>
```

---

## 7. ⚠️ Backend Issues & Required Changes

These are concrete backend changes that **will break the app or create security issues** if not addressed before production.

---

### 🔴 CRITICAL

#### Issue #1 — No JWT Refresh Endpoint
**Problem**: The backend has `/auth/login` and `/auth/register` but no `/auth/refresh` token endpoint. JWT access tokens expire. When they do, the app currently has to force the user to re-login — which is catastrophic if they're in an active SOS.

**Fix Required**:
```python
# Add to auth router
@router.post("/auth/refresh", response_model=TokenResponse)
async def refresh_token(
    refresh_token: str = Body(...),
    db: AsyncSession = Depends(get_db)
):
    # Validate refresh token from user_sessions table
    # Issue new access token (15 min expiry)
    # Issue new refresh token (30 days, rotate on use)
```

```sql
-- New table needed
CREATE TABLE user_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  refresh_token_hash TEXT UNIQUE NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);
```

**App behaviour until fixed**: On 401, clear token and route to login. At least ensure the incident state is persisted locally so the user can re-authenticate and re-join their incident.

---

#### Issue #2 — WebSocket JWT in URL Query Parameter
**Problem**: `WS /sos/ws/{incident_id}?token=JWT` — the JWT is embedded in the URL. Server access logs, proxy logs, and CDN logs will record it. This is a known OWASP vulnerability.

**Fix Required**:
```python
# Accept token from Authorization header during WebSocket upgrade
# Most WS clients send the upgrade as an HTTP request, so headers work.
@router.websocket("/ws/{incident_id}")
async def incident_ws(
    websocket: WebSocket,
    incident_id: str,
    # Keep query param as fallback for backward compat
    token: str | None = Query(None),
):
    # Try header first
    auth_header = websocket.headers.get("authorization")
    raw_token = auth_header.replace("Bearer ", "") if auth_header else token
```

**Flutter side (once backend fixed)**:
```dart
_channel = WebSocketChannel.connect(
  uri,
  headers: {'Authorization': 'Bearer $jwt'},
);
```

---

#### Issue #3 — `/emergency/bundle` Route Not in Verified Route Map
**Problem**: The README documents `POST /emergency/bundle` but it does not appear in the `grep -R "@router"` output. Only `POST /sos/trigger` is verified as existing.

**Impact**: If the Flutter app calls `/emergency/bundle`, it will get a 404.

**Fix Required**: Either confirm the route exists (and re-run the verification) or document that `/sos/trigger` now returns the full bundle in its `SOSResponse` schema. Update the OpenAPI docs accordingly.

**Interim Flutter strategy**: Call `/sos/trigger` only, and expect `SOSResponse` to contain the bundle data. Confirm shape with backend team.

---

#### Issue #4 — Missing WebSocket Heartbeat / Ping-Pong
**Problem**: No heartbeat protocol is documented. Mobile networks have aggressive idle connection timeouts (carrier NATs drop TCP after 30–90 s of silence). Without ping/pong, the WebSocket will silently die and the app will think it's still connected.

**Fix Required**:
```python
# In websocket_manager.py — send ping every 25 seconds
async def _heartbeat(self, websocket: WebSocket):
    while True:
        await asyncio.sleep(25)
        try:
            await websocket.send_json({"type": "ping"})
        except Exception:
            break
```

**Flutter side**:
```dart
// Detect pong / silence
if no frame received in 35 s → close socket → reconnect
```

---

### 🟠 HIGH PRIORITY

#### Issue #5 — Volunteer Respond Endpoint Missing from README
`POST /volunteers/incidents/{id}/respond` exists in the route grep but is not in the README API summary. Flutter volunteer flow cannot be built without documented request/response schema.

**Fix Required**: Document the endpoint:
```python
# Request body
{ "action": "accept" | "decline", "eta_minutes": int | None }
# Response
{ "attempt_id": str, "status": "accepted" | "declined" }
```

---

#### Issue #6 — FCM Token Schema Not Documented
`POST /users/me/device-token` exists in routes. Flutter needs the exact request body format.

**Fix Required**:
```python
# Confirm schema matches
class DeviceTokenRequest(BaseModel):
    fcm_token: str
    platform: str  # "android" | "ios"
    app_version: str | None = None
```

---

#### Issue #7 — Rate Limit Response Body Format Unknown
The Flutter app needs to parse 429 responses to show a retry countdown to the user.

**Fix Required**: Standardise the 429 body:
```json
{
  "detail": "Rate limit exceeded",
  "retry_after_seconds": 12
}
```
And set the `Retry-After` HTTP header accordingly. Flutter reads this header to drive the countdown timer.

---

#### Issue #8 — CORS: Mobile Clients Don't Send Origin
Native Flutter apps do not send the `Origin` header (that's a browser behaviour). The backend's `CORS_ORIGINS` setting has no effect on mobile API calls.

**No change needed for basic API calls.** However, if you're serving WebSocket through a proxy/CDN that enforces CORS, ensure it allows origin-less requests.

**Action**: Double-check that the Nginx/Caddy/Cloudflare proxy in front of FastAPI does not reject requests without `Origin`.

---

#### Issue #9 — Mesh Relay HMAC Key Distribution
**Problem**: The Flutter app needs `MESH_RELAY_SIGNING_KEY` to sign offline payloads client-side. It can't be hardcoded (it's a server secret) and it can't be in the APK binary.

**Fix Required**: Add a seeding endpoint:
```python
@router.get("/auth/mesh-relay-key", dependencies=[Depends(get_current_user)])
async def get_mesh_relay_key() -> dict:
    # Return a per-user HMAC sub-key derived from MESH_RELAY_SIGNING_KEY + user_id
    # NEVER return the master key
    derived_key = hmac.new(MESH_RELAY_SIGNING_KEY, user_id.bytes, sha256).hexdigest()
    return {"key": derived_key, "algorithm": "HMAC-SHA256"}
```

The backend must then verify relay packets with `HMAC(master_key, user_id) == packet.sig` or store the per-user derived key.

---

#### Issue #10 — Location Update Endpoint Schema Unknown
`POST /sos/incidents/{id}/location` exists but the body format is not documented.

**Fix Required**:
```python
class LocationUpdate(BaseModel):
    latitude: float
    longitude: float
    accuracy_meters: float | None = None
    speed_kmh: float | None = None
    heading_degrees: float | None = None
    recorded_at: datetime
```

---

### 🟡 MEDIUM PRIORITY

#### Issue #11 — SMS Fallback on iOS is Impossible (Direct Send)
iOS forbids direct SMS sending. The `/sos/sms-fallback-payload` response should include a flag so Flutter knows whether to send directly (Android) or open Messages pre-filled (iOS).

**Fix Required**: Add `platform_can_auto_send: bool` to the response, or Flutter should detect platform and act accordingly (Flutter can do this with `Platform.isIOS`).

---

#### Issue #12 — Large Emergency Bundle on Slow Connections
The `/emergency/bundle` response contains nested services, action plan, offline payload, country fallbacks. On 2G (≈ 50 kbps), a 10 KB response takes 1.6 s just in transfer.

**Optimisations**:
- Enable `gzip` compression on the FastAPI response (add `GZipMiddleware`).
- Return services as IDs only with a lazy-load endpoint for details.
- Cap action plan to 5 items initially; rest behind a "see more" endpoint.

```python
# In main.py
from fastapi.middleware.gzip import GZipMiddleware
app.add_middleware(GZipMiddleware, minimum_size=500)
```

---

#### Issue #13 — No OpenAPI Client Generation for Schemas
The backend has Pydantic models but no auto-generated OpenAPI client is shared with Flutter. Every API call requires manual schema maintenance.

**Recommendation**: Generate `openapi.json` from the running FastAPI instance and run `openapi-generator-cli` to produce Dart retrofit classes:
```bash
curl http://localhost:8000/openapi.json > openapi.json
openapi-generator-cli generate -i openapi.json -g dart-dio -o lib/data/generated
```

---

## 8. Integration Test Checklist

Before shipping any release:

- [ ] POST `/auth/register` → 201, JWT returned, FCM token registered
- [ ] POST `/auth/login` → 200, JWT decoded, role in claims
- [ ] POST `/sos/trigger` (P1 keywords) → 200, P1_CRITICAL in response, background job created
- [ ] POST `/emergency/bundle` → 200, goldenHourRisk ∈ [0,1], actionPlan.length > 0 (or confirm route = /sos/trigger)
- [ ] WS `/sos/ws/:id` → connect, receive tier0_dispatched event within 3 s
- [ ] GET `/sos/offline-services` → 200, services array non-empty, geohash matches
- [ ] POST `/emergency/mesh-relay` → 200 with valid packet, 400 with expired timestamp
- [ ] POST `/helper/query` (life-threat keywords) → response contains SOS_FIRST_PREFIX
- [ ] POST `/helper/query` → 429 after 20 req/min
- [ ] POST `/volunteers/toggle-availability` → 200, volunteer appears in nearby search
- [ ] WS `/dashboard/ws` → connect with dispatcher JWT, receive events
- [ ] POST `/users/me/device-token` → 200, token stored
- [ ] GET `/health/ready` → 200, all services healthy
