import 'package:flutter/material.dart';

final primaryTextTheme = ThemeData.light().textTheme.copyWith(
      titleMedium: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.black54),
    );
final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Raleway',
  primaryTextTheme: primaryTextTheme,
  indicatorColor: Colors.black54,
);
