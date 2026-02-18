import 'package:hive_flutter/hive_flutter.dart';

/// PIN Authenticator
/// Manages PIN storage and verification for CryptX access control.
class PinAuthenticator {
  static const String _boxName = 'cryptx_auth';
  static const String _pinKey = 'user_pin';

  /// Save the user's PIN securely in Hive local storage
  static Future<void> setPin(String pin) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_pinKey, pin);
  }

  /// Verify the entered PIN against stored PIN
  static Future<bool> verifyPin(String inputPin) async {
    final box = await Hive.openBox(_boxName);
    final storedPin = box.get(_pinKey);
    return storedPin != null && storedPin == inputPin;
  }

  /// Check if a PIN has been set
  static Future<bool> hasPin() async {
    final box = await Hive.openBox(_boxName);
    return box.containsKey(_pinKey);
  }
}

// update 6 - 2025-12-08
// update 14 - 2025-12-13
// update 17 - 2025-12-14
// update 29 - 2025-12-20
// update 51 - 2026-01-01
// update 70 - 2026-01-17
// update 87 - 2026-01-29
// update 89 - 2026-02-01
// update 100 - 2026-02-09
// update 102 - 2026-02-11
// update 104 - 2026-02-13
// update 108 - 2026-02-16
// update 110 - 2026-02-17
// update 113 - 2026-02-18