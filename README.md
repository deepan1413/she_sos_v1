# 🛡️ SheSOS – Community-Based Women Safety App

SheSOS is a community-driven women safety application built with Flutter. It enables users to quickly request help and receive support from nearby volunteers, creating a real-time safety network powered by people.

---

## ✨ Overview

Traditional safety apps rely only on emergency contacts or authorities. SheSOS extends this by introducing a **community response system**, allowing nearby users to assist during emergencies.

The app focuses on:

* Faster response time
* Real-time communication
* Community-based protection

---

## 🚀 Core Features

### 🔴 SOS Emergency System

* One-tap SOS activation
* Triggers alerts to nearby volunteers
* Prevents duplicate active SOS sessions

### 📍 Live Location Tracking

* Shares user’s real-time location during emergencies
* Continuous updates for responders

### 👥 Community Assistance

* Nearby users receive SOS alerts
* Enables a decentralized support system
* Improves response speed

### 🔔 Notifications

* Real-time push notifications for SOS events
* Alerts for messages and updates

### 🔐 Authentication

* Secure login and registration
* Firebase-based authentication

---

## 🧱 Tech Stack

### Frontend

* Flutter (Dart)
* Clean architecture (feature-based structure)

### Backend

* REST API (Node.js / Express recommended)
* Handles SOS, users, and notifications

### Cloud Services

* Firebase Authentication
* Firebase Cloud Messaging (FCM)

### Database

* MongoDB / SQL (based on backend implementation)

---

## 📂 Project Structure

```
lib/
├── core/            # Constants, helpers, utilities
├── features/        # Feature modules (auth, sos, home)
├── models/          # Data models
├── services/        # API & Firebase services
├── widgets/         # Reusable UI components
└── main.dart
```

---

## ⚙️ Setup Instructions

### 1. Clone Repository

```
git clone https://github.com/deepan1413/she_sos_v1.git
cd she_sos_v1
```

### 2. Install Dependencies

```
flutter pub get
```

### 3. Configure Firebase

* Add `google-services.json` in `android/app/`
* Add `GoogleService-Info.plist` in `ios/Runner/`
* Enable:

  * Authentication
  * Cloud Messaging

### 4. Run Application

```
flutter run
```

---

## 🔌 Configuration

Update backend URL in your API service file:

```dart
const String baseUrl = "http://localhost:5000";
```

---

## 🎨 Design Concept

The app icon and UI are designed around:

* **Shield** → Protection
* **Group of People** → Community support
* **Central Figure** → User safety

The visual identity focuses on trust, safety, and collaboration rather than fear or urgency.

---

## 🧪 Future Improvements

* SOS audio/video recording
* Offline SMS fallback system
* Volunteer verification system
* Safe zone and heatmap features
* Wearable device integration

---

## 🤝 Contribution

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Open a pull request

---

## 📄 License

This project is licensed under the MIT License.

---

## 📬 Contact

Deepan L
Email: [vtu27119@veltech.edu.in](mailto:vtu27119@veltech.edu.in)
Portfolio: https://www.deepan.site
Arunkumar S
Email: [vtu27199@veltech.edu.in](mailto:vtu27199@veltech.edu.in)

---
