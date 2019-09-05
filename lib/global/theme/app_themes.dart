import 'package:flutter/material.dart';

import 'theme_data/theme.dart';

enum AppTheme { Default, Dark, Light }

final Map<AppTheme, BaseTheme> themes = {
  AppTheme.Default: BaseTheme(),
  AppTheme.Dark: DarkTheme(),
  AppTheme.Light: LightTheme(),
};

Map<AppTheme, ThemeData> get appThemeData {
  Map<AppTheme, ThemeData> data = {};
  int themeCount = themes.length;
  for (int i = 0; i < themeCount; i++) {
    final theme = themes.values.elementAt(i);
    final themeData = ThemeData(
        primaryColor: theme.primaryColor,
        brightness: theme.brightness,
        accentColor: theme.accentColor,
        backgroundColor: theme.backgroundColor,
        primarySwatch: theme.primarySwatch,
        textTheme: theme.textTheme,
        hintColor: theme.hintColor,
        appBarTheme: theme.appBarTheme,
        tabBarTheme: theme.tabBarTheme);
    data.putIfAbsent(themes.keys.elementAt(i), () {
      return themeData;
    });
  }
  return data;
}

//final appThemeData = {
//  AppTheme.Dark: ThemeData(
//    brightness: Brightness.dark,
//    primaryColor: Colors.black,
//  ),
//  AppTheme.Light: ThemeData(
//    brightness: Brightness.light,
//    primaryColor: Colors.white,
//  ),
//};
