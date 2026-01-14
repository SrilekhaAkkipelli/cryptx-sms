# CryptX – Encrypted SMS Communication

A **Flutter-based Android application** that provides secure, offline SMS communication using the **XChaCha20-Poly1305** encryption algorithm with **PIN-based authentication**.

## 📌 Project Info
- **College:** G. Narayanamma Institute of Technology and Science (For Women)
- **Department:** Information Technology
- **Academic Year:** December 2025 – April 2026
- **Team:** Srilekha Akkipelli, Vishwasri Ramdeni, Sumayya Sadaf
- **Guide:** Mrs. D. Vandana, Assistant Professor

## 🔐 Key Features
- ✅ End-to-end SMS encryption using **XChaCha20-Poly1305**
- ✅ **Offline** operation — no internet required
- ✅ PIN-based authentication to view decrypted messages
- ✅ SMS-safe encoding (Morse-inspired) for transmission
- ✅ Automatic CryptX message detection
- ✅ Local encrypted storage using Hive
- ✅ Clean Flutter UI

## 🛠️ Tech Stack
| Layer | Technology |
|-------|-----------|
| Frontend | Flutter (Dart) |
| Encryption | XChaCha20-Poly1305 (cryptography package) |
| Key Derivation | PBKDF2-HMAC-SHA256 |
| Local Storage | Hive |
| SMS | flutter_telephony |

## 📁 Project Structure
```
cryptx-sms/
├── lib/
│   ├── models/
│   │   └── message_model.dart        # Message data model
│   ├── modules/
│   │   ├── encryption_handler.dart   # XChaCha20 encrypt/decrypt
│   │   ├── sms_encoder.dart          # SMS-safe encoding/decoding
│   │   ├── sms_sender.dart           # Native SMS sending
│   │   ├── sms_receiver.dart         # Incoming SMS listener
│   │   ├── pin_authenticator.dart    # PIN verification
│   │   └── secure_storage.dart       # Hive local storage
│   ├── screens/
│   │   ├── login_screen.dart         # PIN login screen
│   │   ├── home_screen.dart          # Chat list
│   │   └── chat_screen.dart          # Individual chat
│   └── main.dart
├── pubspec.yaml
└── README.md
```

## 🔒 How It Works

```
SENDER:  Message → XChaCha20 Encrypt → SMS-Safe Encode → Send SMS
RECEIVER: Receive SMS → Detect CryptX → Decode → PIN Auth → Decrypt → Display
```

## 📦 Dependencies

```yaml
dependencies:
  cryptography: ^2.7.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  telephony: ^0.2.0
  permission_handler: ^11.0.0
```

## 🚀 Getting Started

```bash
flutter pub get
flutter run
```

## 📊 Test Results
| Test | Result |
|------|--------|
| Send Encrypted SMS | ✅ Pass |
| Receive & Detect CryptX | ✅ Pass |
| Correct PIN Decryption | ✅ Pass |
| Wrong PIN Access Denied | ✅ Pass |
| Offline Functionality | ✅ Pass |
| SMS Encoding Integrity | ✅ Pass |

<!-- init -->
// update 5 - 2025-12-06
// update 19 - 2025-12-15
// update 20 - 2025-12-16
// update 39 - 2025-12-24
// update 41 - 2025-12-25
// update 53 - 2026-01-02
// update 66 - 2026-01-12
// update 67 - 2026-01-14