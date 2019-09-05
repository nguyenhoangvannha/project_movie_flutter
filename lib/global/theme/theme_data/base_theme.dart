import 'package:flutter/material.dart';

class BaseTheme {
  Brightness get brightness => Brightness.light;

  Color get primaryColor => Colors.black;

  Color get primarySwatch => Colors.blue;

  Color get accentColor => Colors.grey;

  Color get backgroundColor => Colors.white;

  Color get hintColor => Colors.white;

  AppBarTheme get appBarTheme =>
      AppBarTheme(brightness: brightness, color: primaryColor);

  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: Colors.black,
        indicator:
            UnderlineTabIndicator(borderSide: BorderSide(color: accentColor)),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      );

  TextStyle get title =>
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle get subtitle =>
      TextStyle(
          color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold);

  TextStyle get body1 =>
      TextStyle(backgroundColor: Colors.white,
          color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 14);

  TextTheme get textTheme =>
      TextTheme(title: title, subtitle: subtitle, body1: body1);
}
