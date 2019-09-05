import 'package:flutter/material.dart';

import 'base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Brightness get brightness {
    return Brightness.light;
  }

  @override
  Color get primaryColor {
    return Colors.white;
  }
}
