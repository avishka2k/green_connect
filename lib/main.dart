import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/tmp/add_lecturers.dart';
import 'package:green_connect/tmp/add_module.dart';

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
      home: AddLecturer(),
    );
  }
}
