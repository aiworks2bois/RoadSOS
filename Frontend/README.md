# 📱 RoadSoS Mobile App

The RoadSoS mobile application is an **offline-first, hyper-responsive** Flutter app designed to save lives during the crucial "Golden Hour" of a road accident. It allows victims to instantly trigger an SOS, coordinates with the backend for emergency routing, and handles extreme network conditions seamlessly.

![Flutter Banner](https://via.placeholder.com/1200x300/141820/2979FF?text=RoadSoS+Mobile+Client)

---

## ✨ Key Features

*   **Offline-First Architecture**: Uses **Drift** (SQLite) and **Hive** to aggressively cache nearby emergency services and triage guidelines. If you lose connection during a crash, the app still works.
*   **Mesh Relay (Bluetooth / Wi-Fi Direct)**: In complete cellular dead-zones, the app generates a highly compressed, cryptographically signed JSON payload. It broadcasts this over BLE/Wi-Fi to passing vehicles, who seamlessly relay it to the cloud once they regain signal.
*   **Auto-Crash Detection**: Integrates with device accelerometers and gyroscopes to detect high-G impacts (>8G) and rollover events, automatically initiating a countdown to trigger an SOS.
*   **Live WebSockets**: Maintains a persistent connection to the dispatcher via WebSockets, allowing victims to see exactly where their responders are on a live OpenStreetMap.
*   **Golden Hour Rescue Bundle**: Displays an immediate, personalized action plan (e.g., CPR steps, hazard warnings) alongside trust-scored nearby hospitals and towing services.

---

## 🛠️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/) (SDK >= 3.22.0)
*   **State Management**: `hooks_riverpod` + `riverpod_annotation`
*   **Networking**: `dio` + `retrofit` (with automatic GZip and Token Injection)
*   **Local Persistence**: `drift` (Relational) + `hive_flutter` (Key-Value)
*   **Maps & Location**: `flutter_map` (OpenStreetMap) + `geolocator`
*   **Security**: `flutter_secure_storage` (AES-256 Key Storage)

---

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK (v3.22.0 or higher)
*   Android Studio / Xcode for emulators and building
*   A running RoadSoS Backend (see the [Backend README](../Backend/README.md))

### 1. Installation
Clone the repository and install dependencies:
```bash
cd Frontend
flutter pub get
```

### 2. Generate Code
RoadSoS relies on code generation for Riverpod, Freezed models, and Retrofit APIs. Run the build runner:
```bash
dart run build_runner build -d
```

### 3. Firebase Configuration (Push Notifications)
To enable push notifications (FCM), you must place your Firebase configuration files into the project:
*   **Android**: Place `google-services.json` in `android/app/`
*   **iOS**: Place `GoogleService-Info.plist` in `ios/Runner/`

### 4. Run the App
The app uses flavors to manage different environments (`dev`, `staging`, `prod`). 

To run the app pointing to your local development backend:
```bash
flutter run --dart-define=FLAVOR=dev
```

*Note: If testing on a physical Android or iOS device against a local backend, ensure you update `AppConfig` in `lib/core/config/app_config.dart` with your computer's local Wi-Fi IP address (e.g., `192.168.1.5`).*

---

## 🏗️ Folder Architecture (Layer-First)

The codebase follows a structured, layer-first approach for clean separation of concerns:

```
lib/
├── core/            # Infrastructure (Routing, Network, Theme, Offline Queues)
├── data/            # Repositories, Local DB (Drift), Remote APIs (Retrofit)
├── domain/          # Riverpod Providers and Business Logic
└── presentation/    # UI Layer (Screens, Widgets)
    ├── auth/
    ├── sos/         # Core Emergency flows (Trigger, Live Tracking, Bundle)
    ├── services_map/
    └── volunteer/
```

---

## 🎨 Design System

RoadSoS uses a custom, high-contrast dark mode design system tailored for emergency visibility (WCAG AAA compliant). 
*   **Colors**: Defined in `lib/core/theme/color_tokens.dart`. Highlights use vibrant, semantic colors (Red = Critical, Green = Verified/Safe).
*   **Typography**: *Space Grotesk* for modern readability, and *JetBrains Mono* for coordinates and incident IDs.

## 🤝 Contributing
Ensure you run `flutter analyze` and `dart format` before submitting PRs. All critical emergency flows MUST handle `OfflineException` gracefully.
