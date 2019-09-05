import 'package:flutter/material.dart';

class BaseTheme {
  Brightness get brightness => Brightness.light;

  Color get primaryColor => Colors.black;

  Color get primarySwatch => Colors.blue;

  Color get accentColor => Colors.grey;

  Color get backgroundColor => Colors.white;

  AppBarTheme get appBarTheme =>
      AppBarTheme(brightness: brightness, color: primaryColor);

  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: Colors.black,
        indicator:
            UnderlineTabIndicator(borderSide: BorderSide(color: accentColor)),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      );

  TextTheme get textTheme => TextTheme(title: TextStyle(color: Colors.black));
}
