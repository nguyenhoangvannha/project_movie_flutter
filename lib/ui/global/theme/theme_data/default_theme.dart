import 'package:flutter/material.dart';

final primaryTextTheme = ThemeData.light().textTheme.copyWith(
      titleMedium: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.black54),
    );
final defaultTheme = ThemeData(
  brightness: Brightness.light,
  //fontFamily: 'Raleway',
  primaryTextTheme: primaryTextTheme,
  indicatorColor: Colors.black54,
  appBarTheme: AppBarTheme(color: Colors.black),
);
