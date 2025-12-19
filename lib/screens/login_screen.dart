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