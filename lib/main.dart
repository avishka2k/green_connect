import 'package:flutter/material.dart';
import 'package:green_connect/profile/profile_main.dart';

import 'main_layer.dart';

void main() {
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
          primaryColor: const Color(0xFF18A689)),
      home: MainLayer(),
    );
  }
}
