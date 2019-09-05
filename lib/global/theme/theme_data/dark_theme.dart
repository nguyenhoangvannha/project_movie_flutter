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
  TextTheme get textTheme => TextTheme(title: TextStyle(color: Colors.white));
}
