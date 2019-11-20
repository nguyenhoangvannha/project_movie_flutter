import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';
import '../app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String DARK_THEME = "ThemeBloc_DARK_THEME";

  static ThemeBloc _instance;

  SharedPreferences prefs;

  ThemeBloc._() {
    _loadSettings();
  }

  static ThemeBloc get instance {
    if (_instance == null) {
      _instance = ThemeBloc._();
    }
    return _instance;
  }

  @override
  ThemeState get initialState =>
      ThemeState(themeData: appThemeData[AppTheme.Light]);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event,) async* {
    if (event is ThemeChanged) {
      bool darkTheme = event.theme == AppTheme.Dark;
      await _saveSettings(darkTheme);
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }

  _loadSettings() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    bool _darkTheme = prefs.getBool(DARK_THEME) ?? false;
    dispatch(ThemeChanged(theme: _darkTheme ? AppTheme.Dark : AppTheme.Light));
    return _darkTheme;
  }

  _saveSettings(bool darkTheme) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    await prefs.setBool(DARK_THEME, darkTheme);
  }
}
