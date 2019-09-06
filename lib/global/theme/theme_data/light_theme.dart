import 'package:flutter/material.dart';

final primaryTextTheme = ThemeData.light().textTheme.copyWith(
      title: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Colors.red),
      button: TextStyle(color: Colors.red),
      caption: TextStyle(color: Colors.red),
      overline: TextStyle(color: Colors.red),
      body1: TextStyle(color: Colors.black54),
      body2: TextStyle(color: Colors.black54),
      display1: TextStyle(color: Colors.green),
      display2: TextStyle(color: Colors.green),
      display3: TextStyle(color: Colors.green),
      display4: TextStyle(color: Colors.green),
      headline: TextStyle(color: Colors.red),
      subhead: TextStyle(color: Colors.red),
    );
final lightTheme = ThemeData.light().copyWith(
  primaryTextTheme: primaryTextTheme,
  indicatorColor: Colors.black54,
  appBarTheme: AppBarTheme(color: Colors.green),
);
