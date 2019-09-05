import 'package:flutter/material.dart';

import 'base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primaryColor => Colors.white;

  @override
  Color get backgroundColor => Colors.white;

  @override
  Color get hintColor => Colors.grey;

  @override
  Color get accentColor => Colors.black54;

  @override
  TextStyle get textTitleStyle =>
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

  @override
  TextStyle get textSubtitleStyle =>
      TextStyle(
          color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get textBody1Style =>
      TextStyle(backgroundColor: Colors.white,
          color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 14);
}
