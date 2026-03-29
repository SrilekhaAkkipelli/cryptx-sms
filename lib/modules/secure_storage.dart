import 'package:hive_flutter/hive_flutter.dart';
import '../models/message_model.dart';

/// Secure Storage Module
/// Stores encrypted messages locally using Hive.
/// No cloud or external server involvement.
class SecureStorage {
  static const String _boxName = 'cryptx_messages';

  static Future<Box> _openBox() => Hive.openBox(_boxName);

  /// Save a message to local storage
  static Future<void> saveMessage(MessageModel msg) async {
    final box = await _openBox();
    await box.add(msg.toMap());
  }

  /// Get all messages for a phone number
  static Future<List<MessageModel>> getMessages(String phone) async {
    final box = await _openBox();
    return box.values
        .where((m) => m['phone'] == phone)
        .map((m) => MessageModel.fromMap(Map<String, dynamic>.from(m)))
        .toList()
      ..sort((a, b) => a.time.compareTo(b.time));
  }

  /// Get list of all chat contacts
  static Future<List<String>> getContacts() async {
    final box = await _openBox();
    return box.values.map((m) => m['phone'] as String).toSet().toList();
  }

  /// Delete all messages for a contact
  static Future<void> deleteChat(String phone) async {
    final box = await _openBox();
    final keys = box.keys
        .where((k) => box.get(k)?['phone'] == phone)
        .toList();
    await box.deleteAll(keys);
  }
}

// update 16 - 2025-12-13
// update 25 - 2025-12-18
// update 30 - 2025-12-20
// update 34 - 2025-12-22
// update 37 - 2025-12-24
// update 43 - 2025-12-26
// update 45 - 2025-12-28
// update 52 - 2026-01-02
// update 59 - 2026-01-06
// update 63 - 2026-01-10
// update 65 - 2026-01-10
// update 74 - 2026-01-18
// update 86 - 2026-01-28
// update 90 - 2026-02-04
// update 118 - 2026-02-20
// update 133 - 2026-03-01
// update 161 - 2026-03-20
// update 165 - 2026-03-23
// update 168 - 2026-03-25
// update 169 - 2026-03-27
// update 170 - 2026-03-29