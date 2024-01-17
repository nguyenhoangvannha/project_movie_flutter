import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../app_themes.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent() : super();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  const ThemeChanged({required this.theme}) : super();

  @override
  List<Object> get props => [theme];
}
