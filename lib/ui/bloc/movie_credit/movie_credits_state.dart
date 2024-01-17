import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';

@immutable
abstract class MovieCreditsState extends Equatable {
  MovieCreditsState() : super();
}

class Loading extends MovieCreditsState {
  @override
  List<Object> get props => [];
}

class Error extends MovieCreditsState {
  final Object? exception;

  Error(this.exception) : super();

  @override
  List<Object> get props => [exception.runtimeType];
}

class Loaded extends MovieCreditsState {
  final List<Cast>? casts;

  Loaded({this.casts}) : super();

  @override
  List<Object> get props => [];
}
