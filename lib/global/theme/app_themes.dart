import 'package:flutter/material.dart';

enum AppTheme { Dark, Light, GreenDark, GreenLight }

final appThemeData = {
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  ),
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
  ),
};
