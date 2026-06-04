# 🚑 RoadSoS

**RoadSoS** is an offline-first, full-stack emergency response system designed to drastically reduce response times during the "Golden Hour" of a road accident. It connects victims directly with nearby volunteers, official emergency services, and automated triage systems.

![RoadSoS Banner](https://via.placeholder.com/1200x400/141820/FF2D2D?text=RoadSoS+Emergency+Response)

---

## 🌟 The Vision

When a crash happens, every second counts. Traditional emergency lines can be slow, location data can be inaccurate, and cellular networks can fail. RoadSoS solves this by offering:

1. **Instant, Deterministic Triage**: High-G impacts and critical keywords trigger immediate priority routing.
2. **Offline Mesh Relay**: In dead zones, the app broadcasts signed SOS packets via Bluetooth/Wi-Fi Direct to passing vehicles, which relay the signal to the cloud upon regaining connectivity.
3. **The Golden Hour Bundle**: The system immediately replies with nearby verified hospitals, an action plan, and local fallback numbers.
4. **Live Dispatch Tracking**: Victims see exactly where their responders are on a live map, reducing panic.

---

## 🏗️ Project Structure

RoadSoS is a monorepo containing both the Flutter mobile application and the FastAPI backend service.

### 📱 [Frontend (Flutter)](/Frontend)
The mobile application built for Android and iOS. 
- **Offline-First**: Uses Drift and Hive to cache emergency services and bundle data locally.
- **Sensor Fusion**: Integrates with device accelerometers to auto-detect severe collisions.
- **Riverpod & Dio**: Robust state management and networking, fully equipped to handle background WebSocket reconnects.

*Read the [Frontend Documentation ➔](/Frontend/README.md)*

### ⚙️ [Backend (FastAPI)](/Backend)
The high-performance API server and dispatcher engine.
- **PostGIS & pgvector**: Handles geospatial queries for responder matching and semantic search for the AI Helper Bot.
- **WebSocket Manager**: Streams live coordinates and dispatch status to active responders and victims.
- **Escalation Engine**: A background task queue that escalates unresolved incidents to larger radiuses and official channels.

*Read the [Backend Documentation ➔](/Backend/README.md)*

---

## 🚀 Quick Start (Local Development)

To run the complete system locally, you'll need two terminal windows.

### 1. Start the Backend
Navigate to the backend directory, install the Python dependencies, and start the Uvicorn server:
```bash
cd Backend
python -m venv .venv
# Activate the venv (Windows: .venv\Scripts\activate, Mac/Linux: source .venv/bin/activate)
pip install -r requirements.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8002
```
*The API will be live at http://127.0.0.1:8002.*

### 2. Run the Mobile App
Navigate to the frontend directory, install Flutter packages, and launch the app:
```bash
cd Frontend
flutter pub get
flutter run --dart-define=FLAVOR=dev
```
*Make sure to update `AppConfig` with your local IP if testing on a physical device over Wi-Fi!*

---

## 🔒 Security & Privacy

Emergency data is highly sensitive.
- **JWT Authentication**: All API endpoints and WebSockets are secured via JWT.
- **AES-256 On-Device Encryption**: Secure storage is used for auth tokens and Mesh Relay signing keys.
- **Signed Offline Packets**: All Mesh Relay packets are cryptographically HMAC-signed to prevent spoofing.

---

## 🤝 Contributing

We welcome contributions! Please review the [Design System](03_DESIGN_SYSTEM.md) and [PRD](02_PRD.md) documents before submitting a Pull Request to ensure alignment with our offline-first architecture and performance requirements.

## 📄 License
This project is licensed under the MIT License.
