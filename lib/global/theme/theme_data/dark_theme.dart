import 'package:flutter/material.dart';

import 'base_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primaryColor => Colors.black;

  @override
  Color get backgroundColor => Colors.black;

  @override
  Color get hintColor => Colors.white70;

  @override
  Color get accentColor => Colors.white70;

  @override
  TextStyle get textTitleStyle =>
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  @override
  TextStyle get textSubtitleStyle =>
      TextStyle(
          color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get textBody1Style =>
      TextStyle(
          color: Colors.white, fontWeight: FontWeight.normal, fontSize: 14);
}
