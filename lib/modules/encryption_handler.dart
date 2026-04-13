import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

/// Encryption Handler
/// Uses XChaCha20-Poly1305 for message encryption/decryption.
/// Key is derived from user password using PBKDF2-HMAC-SHA256.
class EncryptionHandler {
  final _algorithm = Xchacha20.poly1305Aead();

  /// Derive a SecretKey from the user's password using PBKDF2
  Future<SecretKey> generateKey(String password) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 100000,
      bits: 256,
    );
    return await pbkdf2.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: utf8.encode('cryptx_fixed_salt'),
    );
  }

  /// Encrypt a plaintext message
  /// Returns map with cipher, nonce, and mac (all base64 encoded)
  Future<Map<String, String>> encrypt(String message, SecretKey key) async {
    final nonce = _algorithm.newNonce();
    final secretBox = await _algorithm.encrypt(
      utf8.encode(message),
      secretKey: key,
      nonce: nonce,
    );
    return {
      'cipher': base64Encode(secretBox.cipherText),
      'nonce': base64Encode(nonce),
      'mac': base64Encode(secretBox.mac.bytes),
    };
  }

  /// Decrypt an encrypted message
  /// Accepts cipher, nonce, mac (all base64 encoded) and key
  Future<String> decrypt(
    String cipher,
    String nonce,
    String mac,
    SecretKey key,
  ) async {
    final secretBox = SecretBox(
      base64Decode(cipher),
      nonce: base64Decode(nonce),
      mac: Mac(base64Decode(mac)),
    );
    final decrypted = await _algorithm.decrypt(secretBox, secretKey: key);
    return utf8.decode(decrypted);
  }
}

// update 2 - 2025-12-02
// update 7 - 2025-12-08
// update 11 - 2025-12-11
// update 21 - 2025-12-17
// update 33 - 2025-12-22
// update 40 - 2025-12-25
// update 46 - 2025-12-29
// update 55 - 2026-01-04
// update 56 - 2026-01-04
// update 57 - 2026-01-05
// update 61 - 2026-01-07
// update 68 - 2026-01-15
// update 83 - 2026-01-27
// update 126 - 2026-02-26
// update 128 - 2026-02-26
// update 131 - 2026-02-28
// update 145 - 2026-03-10
// update 148 - 2026-03-11
// update 160 - 2026-03-20
// update 163 - 2026-03-22
// update 167 - 2026-03-25
// update 199 - 2026-04-13
// update 200 - 2026-04-13