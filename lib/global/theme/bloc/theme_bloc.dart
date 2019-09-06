import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    int hour = DateTime
        .now()
        .hour;
    if (hour > 6 && hour < 19)
      return ThemeState(themeData: appThemeData[AppTheme.Dark]);
    else
      return ThemeState(themeData: appThemeData[AppTheme.Default]);
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event,) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
