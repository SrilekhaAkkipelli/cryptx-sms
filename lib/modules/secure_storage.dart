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