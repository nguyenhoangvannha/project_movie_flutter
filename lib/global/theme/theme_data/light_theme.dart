import 'package:flutter/material.dart';

import 'base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primaryColor => Colors.white;

  @override
  Color get hintColor => Colors.grey;
}
