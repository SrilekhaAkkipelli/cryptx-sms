import 'package:flutter/material.dart';
import '../modules/pin_authenticator.dart';
import 'home_screen.dart';

/// Login Screen
/// First screen shown to user. Requires PIN to access CryptX.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pwdController = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _start() async {
    if (_pwdController.text.isEmpty) {
      setState(() => _error = 'Please enter your PIN');
      return;
    }
    setState(() { _loading = true; _error = null; });

    final valid = await PinAuthenticator.verifyPin(_pwdController.text);
    if (!mounted) return;

    if (valid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() {
        _error = 'Incorrect PIN. Access denied.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Color(0xFF00FF88)),
              const SizedBox(height: 16),
              const Text('CryptX',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('Secure SMS Encryption',
                style: TextStyle(color: Colors.white54, fontSize: 14)),
              const SizedBox(height: 48),
              TextField(
                controller: _pwdController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  errorText: _error,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _start,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF88),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  ),
                  child: _loading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text('Start CryptX',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16),
              const Text('🔒 Your messages stay encrypted',
                style: TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

// update 9 - 2025-12-10
// update 13 - 2025-12-12
// update 26 - 2025-12-19
// update 31 - 2025-12-20
// update 47 - 2025-12-29
// update 80 - 2026-01-26
// update 93 - 2026-02-05
// update 96 - 2026-02-06
// update 101 - 2026-02-11
// update 105 - 2026-02-13
// update 115 - 2026-02-19
// update 121 - 2026-02-22
// update 122 - 2026-02-22
// update 151 - 2026-03-14
// update 153 - 2026-03-16
// update 157 - 2026-03-18
// update 159 - 2026-03-19
// update 176 - 2026-03-31
// update 180 - 2026-04-04
// update 181 - 2026-04-04