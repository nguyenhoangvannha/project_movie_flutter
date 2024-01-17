import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LocalizationsEvent extends Equatable {
  const LocalizationsEvent() : super();
}

class LocaleChanged extends LocalizationsEvent {
  final Locale? locale;

  const LocaleChanged({required this.locale}) : super();

  @override
  List<Object?> get props => [locale!.languageCode, locale!.countryCode];
}
