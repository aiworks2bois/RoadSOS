# RoadSoS Flutter — Mobile Optimization Guide

> An emergency app that drains the battery or gets killed by the OS is a broken emergency app.
> These are non-negotiable engineering constraints.

---

## 1. Battery Optimization

### Principle: Pay Battery Only When It Matters

| App State | Location | WebSocket | BLE | Expected Drain |
|-----------|----------|-----------|-----|----------------|
| Idle (no incident) | Off | Off | Passive scan only | < 1% / hr |
| Volunteer on-duty | Every 60 s | Off | Passive scan | ≈ 2% / hr |
| Active incident (victim) | Every 3 s | Open | Off | ≈ 6-8% / hr |
| Active incident (responder) | Every 5 s | Open | Off | ≈ 5-7% / hr |
| Escalation background | Off | Off | Off | < 0.5% / hr |

### Android Battery Whitelisting

```kotlin
// AndroidManifest.xml
<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />

// Request at runtime — necessary for SOS foreground service to survive
Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
intent.setData(Uri.parse("package:" + getPackageName()));
startActivity(intent);
```

**Flutter side:**
```dart
// Use battery_optimization_android package
await BatteryOptimizationAndroid.isIgnoringBatteryOptimizations();
// Prompt if false — do this during onboarding, not mid-SOS
```

### iOS Background Execution

iOS kills background processes aggressively. Mitigation:
1. **Background Fetch**: `UIBackgroundModes: fetch` — used to refresh offline services cache.
2. **Location updates**: `significant-location` mode keeps app alive between updates; switch to full accuracy only during active incident.
3. **VoIP push (CallKit)**: If a P1 dispatch comes for a volunteer, use PushKit / CallKit to wake the app reliably — FCM alone is not guaranteed on iOS while the app is background-suspended.
4. **No direct SMS on iOS**: Apple does not allow apps to send SMS without user interaction. The SMS fallback is Android-only. On iOS, show: "Tap to open Messages with pre-filled SOS".

---

## 2. Background Location Architecture

### Android

```
[App foreground / background]
         │
         ▼
[LocationForegroundService]  ← Sticky notification: "RoadSoS is tracking your location"
         │
         ├─ Active incident: geolocator stream, interval 3s, accuracy Best
         ├─ Volunteer on-duty: interval 60s, accuracy Medium
         └─ Idle: STOPPED
```

```xml
<!-- AndroidManifest.xml -->
<service
  android:name=".LocationForegroundService"
  android:foregroundServiceType="location"
  android:exported="false" />

<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
```

**Critical**: Android 10+ requires `ACCESS_BACKGROUND_LOCATION` to be granted separately in system settings, not via `requestPermissions`. The app must navigate the user to the settings screen.

### iOS

```
// Info.plist
NSLocationAlwaysAndWhenInUseUsageDescription → "RoadSoS needs continuous location during an active emergency"
NSLocationAlwaysUsageDescription            → same
UIBackgroundModes                           → location, fetch, remote-notification
```

Use `geolocator` package with `LocationAccuracy.reduced` when not in active incident. Switch to `LocationAccuracy.best` only when incident is live.

---

## 3. WebSocket Resilience

Mobile networks drop constantly (tunnels, lifts, signal handover). The WebSocket manager must be robust.

```dart
class IncidentSocketManager {
  static const _minBackoff = Duration(seconds: 1);
  static const _maxBackoff = Duration(seconds: 30);
  static const _maxRetries = -1; // infinite while incident is active

  Duration _currentBackoff = _minBackoff;
  int _retryCount = 0;

  Future<void> connect(String incidentId, String jwt) async {
    final uri = Uri.parse('wss://api.roadsos.io/sos/ws/$incidentId?token=$jwt');
    try {
      _channel = WebSocketChannel.connect(uri);
      _currentBackoff = _minBackoff;
      _retryCount = 0;
      _listenForEvents();
    } catch (_) {
      await _scheduleReconnect(incidentId, jwt);
    }
  }

  Future<void> _scheduleReconnect(String id, String jwt) async {
    await Future.delayed(_currentBackoff);
    _currentBackoff = Duration(
      milliseconds: min(_currentBackoff.inMilliseconds * 2, _maxBackoff.inMilliseconds)
    );
    _retryCount++;
    await connect(id, jwt);
  }
}
```

**Heartbeat**: Backend should send a ping frame every 25 s. If no frame received in 35 s, close and reconnect. (Flag this to backend — see §Integration doc.)

---

## 4. Offline-First Data Strategy

### Cache Layers

| Data | Storage | TTL | Eviction |
|------|---------|-----|---------|
| Nearby emergency services | Drift + Hive geohash key | 30 min | LRU, max 500 records |
| JWT + refresh token | flutter_secure_storage | Until expiry | On logout |
| Golden Hour bundle (last incident) | Drift | 7 days | Manual clear |
| Helper Bot conversation | Drift | 30 days | User-initiated |
| Offline SOS queue | Hive | Until flushed | On successful upload |
| Map tiles | flutter_map_tile_caching | 14 days | LRU 500 MB cap |
| RAG confidence threshold config | Hive | 24 hr | On app foreground |

### Offline SOS Queue

```dart
// hive box: 'offline_sos_queue'
@HiveType(typeId: 1)
class PendingSosPayload extends HiveObject {
  @HiveField(0) late String hmacSignedPacket;
  @HiveField(1) late DateTime createdAt;
  @HiveField(2) late int retryCount;
  @HiveField(3) late String localTriageResult;
}

// Flush on connectivity restore
connectivity.onConnectivityChanged.listen((status) {
  if (status != ConnectivityResult.none) {
    offlineQueueService.flush();
  }
});
```

### Connectivity-Aware API Calls

```dart
// In Dio interceptor
if (!await networkInfo.isConnected) {
  // For SOS: queue locally, don't throw
  // For non-critical (helper bot, profile): throw OfflineException → show cached or error
  throw OfflineException();
}
```

---

## 5. Memory Management

### Image / Map Tile Budget
- Map tiles: cap at 200 MB in-memory; spill to disk cache.
- Never decode full-resolution images in incident lists. Use `ResizeImage` with 200px thumb.
- Dispose `MapController` and WebSocket when screen is popped.

### Dispose Pattern

```dart
@override
void dispose() {
  _socketManager.disconnect();       // close WebSocket
  _locationSubscription.cancel();    // stop location stream
  _animationController.dispose();
  super.dispose();
}
```

### Flutter Frame Budget
- Target 60 fps, allow 120 fps on supported hardware.
- Never run synchronous JSON decode on the UI isolate for responses > 50 KB.

```dart
// For large bundle responses, use compute()
final bundle = await compute(_parseBundle, responseJson);
```

---

## 6. Push Notification Architecture

```
FCM (Firebase Cloud Messaging)
        │
        ├── App Foreground  → flutter_local_notifications (show banner)
        ├── App Background  → OS notification tray
        └── App Terminated  → OS notification tray → tap = deep link
```

### Notification Channels (Android 8+)

```kotlin
// Created on app init
NotificationChannel("sos_dispatch", "Emergency Dispatch", IMPORTANCE_HIGH)
  .setSound(Uri.parse("android.resource://com.roadsos/raw/emergency_alert"), audioAttributes)
  .setLockscreenVisibility(Notification.VISIBILITY_PUBLIC)
  .enableVibration(true)
  .setVibrationPattern(longArrayOf(0, 500, 200, 500))

NotificationChannel("escalation", "Escalation Updates", IMPORTANCE_DEFAULT)
NotificationChannel("helper_bot", "Helper Bot", IMPORTANCE_LOW)
```

### FCM Payload Contract (agree with backend)

```json
{
  "to": "<fcm_token>",
  "priority": "high",
  "data": {
    "type": "SOS_DISPATCH" | "ESCALATION" | "RESPONDER_ACCEPTED" | "INCIDENT_RESOLVED",
    "incident_id": "abc-12345",
    "severity": "P1_CRITICAL",
    "message": "New P1 incident 2.4 km away"
  },
  "notification": {
    "title": "🚨 Emergency Nearby",
    "body": "P1 incident 2.4 km — Tap to respond"
  }
}
```

---

## 7. Performance Targets & Tooling

### Profiling Commands

```bash
# Profile mode (no debug overhead)
flutter run --profile

# Memory leak detection
flutter analyze
dart run dart_devtools

# APK size analysis
flutter build apk --analyze-size

# Startup time
adb shell am start -W com.roadsos/com.roadsos.MainActivity
```

### Render Performance

```dart
// In development builds
WidgetsBinding.instance.addTimingsCallback((timings) {
  for (final timing in timings) {
    if (timing.totalSpan > const Duration(milliseconds: 16)) {
      debugPrint('Jank frame: ${timing.totalSpan.inMilliseconds}ms');
    }
  }
});
```

### Build Size Targets

```bash
# Release APK split by ABI
flutter build apk --split-per-abi --release
# arm64-v8a:  target ≤ 22 MB
# armeabi-v7a: target ≤ 20 MB

# Obfuscate Dart code
flutter build apk --obfuscate --split-debug-info=build/debug-info
```

---

## 8. Android-Specific Issues

### Issue A: Android 12 Bluetooth Permissions Revamp
Runtime permissions **BLUETOOTH_SCAN**, **BLUETOOTH_ADVERTISE**, **BLUETOOTH_CONNECT** required.
`BLUETOOTH` + `BLUETOOTH_ADMIN` are legacy (API < 31 only).

```xml
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
```

### Issue B: Android 13 POST_NOTIFICATIONS Runtime Permission
```dart
if (await Permission.notification.isDenied) {
  await Permission.notification.request();
}
```
Do this during onboarding. If denied, FCM dispatch will never show alerts.

### Issue C: Android Doze Mode
Apps in Doze have deferred network access and wake locks suspended.
- Use `FCM high-priority` messages to bypass Doze for dispatch alerts.
- The foreground service (location tracking) is exempted from Doze while running.

### Issue D: Adaptive Battery (Android 9+)
Users who rarely use the app may have it placed in "restricted" battery group, killing background work.
Request battery optimization exemption during onboarding.

### Issue E: Samsung / MIUI / Realme Manufacturer Restrictions
These OEMs aggressively kill background processes beyond Android defaults.
Include manufacturer-specific auto-start guide in onboarding (`autostart` intent).

```dart
// Guide user to: Settings > Apps > RoadSoS > Battery > No restrictions
// Show manufacturer-specific screenshot
```

---

## 9. iOS-Specific Issues

### Issue A: No Direct SMS
`flutter_sms` / `send_sms` cannot send without user confirmation on iOS.
Mitigation: `url_launcher` with `sms:?body=SOS+at+lat,lng` — opens Messages pre-filled.

### Issue B: Background Location Strict Review
Apple App Store requires strong justification for `NSLocationAlwaysUsageDescription`.
Draft exact privacy disclosure: "RoadSoS requires background location to send your position to emergency responders during an active incident. This runs only when you have an open SOS."

### Issue C: BLE Background Advertising Restricted
iOS apps cannot advertise BLE while backgrounded in the foreground-invisible state.
Mesh relay BLE is a best-effort, foreground-only feature on iOS.

### Issue D: VoIP Push for Volunteer Dispatch
For reliable volunteer wake-up on iOS, integrate `PushKit` + `CallKit`.
FCM alone can be delayed by up to 30 min when iOS decides to batch notifications.
Volunteer dispatch is time-critical — use APNs `apns-priority: 10` + PushKit.

---

## 10. Continuous Integration

```yaml
# .github/workflows/flutter_ci.yml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.22.x'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --release --split-per-abi
      - run: flutter build ios --no-codesign
```
