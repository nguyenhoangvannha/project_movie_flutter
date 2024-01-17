import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  static LocalizationsBloc? _instance;

  static const String LOCALE = "LocalizationsBloc_LOCALE";

  SharedPreferences? prefs;

  LocalizationsBloc._(LocalizationsState initState) : super(initState) {
    _loadSettings();
    on<LocaleChanged>(_onLocaleChanged);
  }

  static LocalizationsBloc? get instance {
    _instance ??=
        LocalizationsBloc._(LocalizationsState(locale: ui.window.locale));
    return _instance;
  }

  _loadSettings() async {
    prefs ??= await SharedPreferences.getInstance();
    List<String>? localeString = prefs!.getStringList(LOCALE);
    if (localeString != null) {
      ui.Locale locale =
          ui.Locale(localeString.elementAt(0), localeString.elementAt(1));
      add(LocaleChanged(locale: locale));
    }
  }

  _saveSettings(Locale locale) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!
        .setStringList(LOCALE, [locale.languageCode, locale.countryCode!]);
  }

  FutureOr<void> _onLocaleChanged(
      LocaleChanged event, Emitter<LocalizationsState> emit) async {
    await _saveSettings(event.locale!);
    emit(LocalizationsState(locale: event.locale));
  }
}
