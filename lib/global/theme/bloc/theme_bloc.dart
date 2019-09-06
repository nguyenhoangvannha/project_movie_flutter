import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      ThemeState(themeData: appThemeData[AppTheme.Dark]);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event,) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
