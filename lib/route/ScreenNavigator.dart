import 'package:flutter/material.dart';

class ScreenNavigator {

  static final ScreenNavigator _instance = ScreenNavigator._internal();

  factory ScreenNavigator() {
    return _instance;
  }

  ScreenNavigator._internal();

  Future navigatePush(context, screen) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  Future navigateOf(context, fragment) async {
    Navigator.of(context).pushReplacementNamed(fragment);
  }

  void navigatePop(context) {
    Navigator.pop(context);
  }
}