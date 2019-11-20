import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LocalizationsEvent extends Equatable {
  LocalizationsEvent([List props = const []]) : super(props);
}

class LocaleChanged extends LocalizationsEvent {
  final Locale locale;

  LocaleChanged({@required this.locale})
      : super([locale.languageCode, locale.countryCode]);
}
