import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/firebase/auth/auth_state_changes.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/payment/payment_top_up.dart';
import 'package:green_connect/tmp/test_events_upload.dart';

import 'payment/payment_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: AuthChanges(),
    );
  }
}
