import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onerecipe/utils/Constant.dart';

class IconUtil {
  static final IconUtil _instance = IconUtil._internal();

  factory IconUtil() {
    return _instance;
  }

  IconUtil._internal();

  IconData getIcon(String category) {
    switch (category) {
      case Constant.catPizza:
        {
          return Icons.local_pizza;
        }
      case Constant.catDrinks:
        {
          return Icons.local_drink;
        }
    }
    return Icons.free_breakfast;
  }

  Color getIconBackground(String category) {
    switch (category) {
      case Constant.catPizza:
        {
          return Colors.amber;
        }
      case Constant.catDrinks:
        {
          return Colors.blue;
        }
    }
    return Colors.green;
  }
}
