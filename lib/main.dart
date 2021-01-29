import 'package:flutter/material.dart';
import 'package:onerecipe/ui/home.dart';

import 'ui/widgets/animated_app_bar.dart';

void main() => runApp(OneRecipeApp());

class OneRecipeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
