import 'package:flutter/material.dart';

enum AppTheme { Default, Dark, Light }

final defaultTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(color: Colors.black));

final darkTheme = ThemeData.dark().copyWith();

final lightTheme = ThemeData.light().copyWith();

final appThemeData = {
  AppTheme.Default: defaultTheme,
  AppTheme.Dark: darkTheme,
  AppTheme.Light: lightTheme,
};