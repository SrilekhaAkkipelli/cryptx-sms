import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const CryptXApp());
}

class CryptXApp extends StatelessWidget {
  const CryptXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00FF88),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// update 3 - 2025-12-04
// update 4 - 2025-12-05
// update 8 - 2025-12-08
// update 10 - 2025-12-11
// update 12 - 2025-12-11
// update 35 - 2025-12-23
// update 36 - 2025-12-23
// update 50 - 2025-12-30
// update 60 - 2026-01-07
// update 75 - 2026-01-18
// update 85 - 2026-01-27
// update 103 - 2026-02-12