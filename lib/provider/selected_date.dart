import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String myLocation = 'Colombo';

  void updateVariable(String newValue) {
    myLocation = newValue;
    notifyListeners(); 
  }
}