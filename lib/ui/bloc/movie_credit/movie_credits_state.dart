import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';

@immutable
abstract class MovieCreditsState extends Equatable {
  MovieCreditsState([List props = const []]) : super(props);
}

class Loading extends MovieCreditsState {}

class Error extends MovieCreditsState {
  final Exception exception;

  Error(this.exception) : super([exception.runtimeType]);
}

class Loaded extends MovieCreditsState {
  final List<Cast> casts;

  Loaded({this.casts}) : super([]);
}
