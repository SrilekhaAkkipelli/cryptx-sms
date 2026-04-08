/// Message Model for CryptX
/// Represents a single SMS message (sent or received)
class MessageModel {
  final String phone;
  final String text;
  final bool isSent;
  final DateTime time;
  final bool isEncrypted;

  MessageModel({
    required this.phone,
    required this.text,
    required this.isSent,
    required this.time,
    this.isEncrypted = false,
  });

  Map<String, dynamic> toMap() => {
    'phone': phone,
    'text': text,
    'isSent': isSent,
    'time': time.toIso8601String(),
    'isEncrypted': isEncrypted,
  };

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
    phone: map['phone'],
    text: map['text'],
    isSent: map['isSent'],
    time: DateTime.parse(map['time']),
    isEncrypted: map['isEncrypted'] ?? false,
  );
}

// update 1 - 2025-12-02
// update 24 - 2025-12-18
// update 44 - 2025-12-27
// update 48 - 2025-12-29
// update 54 - 2026-01-02
// update 62 - 2026-01-07
// update 64 - 2026-01-10
// update 77 - 2026-01-19
// update 78 - 2026-01-21
// update 91 - 2026-02-04
// update 92 - 2026-02-05
// update 107 - 2026-02-15
// update 111 - 2026-02-17
// update 119 - 2026-02-21
// update 134 - 2026-03-01
// update 152 - 2026-03-14
// update 156 - 2026-03-17
// update 162 - 2026-03-20
// update 182 - 2026-04-05
// update 189 - 2026-04-08