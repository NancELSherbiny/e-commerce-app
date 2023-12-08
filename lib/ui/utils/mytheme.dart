import 'package:flutter/material.dart';

class MyTheme {
  static Color primary = Color(0xff004182);
  static Color darkBlue = Color(0xff06004F);



  static ThemeData LightMode = ThemeData(
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, ),
          titleMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, ),
          titleSmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, )));

}
