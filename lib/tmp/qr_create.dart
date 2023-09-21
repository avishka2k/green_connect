import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String dateNow = "DateTime.now()'";
  Map<String, dynamic> jsonData = {
    "date": DateTime.now().toString(),
    "email": "john.doe@example.com",
    "phone": "1234567890",
  };

  String? data;

  void initializeData() {
    data = jsonEncode(jsonData);
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Widget ddd() {
    return QrImageView(
      data: data!,
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ddd()],
        ),
      ),
    );
  }
}
