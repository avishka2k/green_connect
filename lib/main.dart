import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/firebase/auth/auth_state_changes.dart';
import 'package:green_connect/getstart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF18A689)),
        useMaterial3: true,
        primaryColor: const Color(0xFF18A689),
      ),
      home: SplashScreen(),
    );
  }
}
