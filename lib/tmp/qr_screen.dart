// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/flutter_toast.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  State<scanner> createState() => _scannerState();
}

List<String> recentTitle = [];
List<String> recentDate = [];

class _scannerState extends State<scanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrScanner(context),
          Positioned(bottom: 70, child: scanning()),
          Positioned(top: 70, child: scannerConroller()),
        ],
      ),
    );
  }

  Widget scanning() => Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(206, 71, 69, 69),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
          child: Row(
            children: [
              const Text(
                'Scanning',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 30,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 100),
                    animatedTexts: [
                      TyperAnimatedText('....',
                          speed: const Duration(milliseconds: 200)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildQrScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderColor: appPrimary,
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen(
      (barcode) async {
        if (barcode != null) {
          print('--------------------------');

          controller.pauseCamera();

          print('Scanned QR code: ${barcode.code}');
          // if (historyStatus != false) {
        } else {
          scanning();
        }
      },
    );
  }

  Widget scannerConroller() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    await controller?.resumeCamera();
                    setState(() {});
                  },
                  icon: FutureBuilder<bool?>(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return snapshot.data!
                            ? Image.asset('assets/icons/flash-on.png',
                                width: 25, color: appPrimary)
                            : Image.asset('assets/icons/flash-off.png',
                                width: 25, color: appPrimary);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  icon: Image.asset('assets/icons/switch-camera.png',
                      width: 25, color: appPrimary),
                ),
                IconButton(
                  onPressed: () async {
                    AppToastmsg.appToastMeassage('Resume Camera');
                    await controller?.resumeCamera();
                    setState(() {});
                  },
                  icon: Image.asset(
                    'assets/icons/refresh.png',
                    width: 25,
                    color: appPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
