import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class MovieDetailsState extends Equatable {
  MovieDetailsState() : super();
}

class Loading extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class Error extends MovieDetailsState {
  final Exception exception;

  Error(this.exception) : super();

  @override
  List<Object> get props => [exception.runtimeType];
}

class Result extends MovieDetailsState {
  final Movie movie;

  Result({@required this.movie}) : super();

  @override
  List<Object> get props => [movie.id];
}
