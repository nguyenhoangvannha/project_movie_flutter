import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';

import './bloc.dart';

class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  @override
  LocalizationsState get initialState {
    return LocalizationsState(locale: ui.window.locale);
  }

  @override
  Stream<LocalizationsState> mapEventToState(
    LocalizationsEvent event,
  ) async* {
    if (event is LocaleChanged) {
      yield LocalizationsState(locale: event.locale);
    }
  }
}
