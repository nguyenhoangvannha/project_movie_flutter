import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LocalizationsState extends Equatable {
  final Locale? locale;

  LocalizationsState({required this.locale}) : super();

  @override
  List<Object?> get props => [locale!.countryCode, locale!.languageCode];
}
