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
