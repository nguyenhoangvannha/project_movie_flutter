import 'package:flutter/material.dart';

final primaryTextTheme = ThemeData.light().textTheme.copyWith(
      title: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.black54),
    );
final defaultTheme = ThemeData.light().copyWith(
  primaryTextTheme: primaryTextTheme,
  indicatorColor: Colors.black54,
  appBarTheme: AppBarTheme(color: Colors.black),
);
