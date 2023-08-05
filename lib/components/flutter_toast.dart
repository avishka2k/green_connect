import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToastmsg {
  static void appToastMeassage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
