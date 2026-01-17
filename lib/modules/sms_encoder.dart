/// SMS-Safe Encoder/Decoder
/// Converts encrypted binary data to SMS-compatible ASCII format
/// and back, ensuring no data corruption during transmission.
class SmsEncoder {
  static const String _prefix = 'CRTX:';

  /// Encode encrypted data map to SMS-safe string
  /// Format: CRTX:<cipher>|<nonce>|<mac>
  static String encode(Map<String, String> encryptedData) {
    final parts = [
      encryptedData['cipher']!,
      encryptedData['nonce']!,
      encryptedData['mac']!,
    ];
    return '$_prefix${parts.join('|')}';
  }

  /// Decode SMS string back to encrypted data map
  static Map<String, String>? decode(String smsText) {
    if (!smsText.startsWith(_prefix)) return null;
    final content = smsText.substring(_prefix.length);
    final parts = content.split('|');
    if (parts.length != 3) return null;
    return {
      'cipher': parts[0],
      'nonce': parts[1],
      'mac': parts[2],
    };
  }

  /// Check if an SMS message is a CryptX encrypted message
  static bool isCryptXMessage(String smsText) {
    return smsText.trim().startsWith(_prefix);
  }
}

// update 18 - 2025-12-15
// update 22 - 2025-12-17
// update 23 - 2025-12-17
// update 28 - 2025-12-19
// update 32 - 2025-12-22
// update 38 - 2025-12-24
// update 42 - 2025-12-25
// update 71 - 2026-01-17