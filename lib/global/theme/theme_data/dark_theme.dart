import 'package:flutter/material.dart';

import 'base_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Brightness get brightness {
    return Brightness.dark;
  }

  @override
  Color get primaryColor {
    return Colors.black;
  }

  @override
  Color get backgroundColor {
    return Colors.black;
  }

  @override
  TextTheme get textTheme {
    return TextTheme(title: TextStyle(color: Colors.white));
  }
}
