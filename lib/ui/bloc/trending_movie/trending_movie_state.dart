import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class TrendingMovieState extends Equatable {
  TrendingMovieState([List props = const []]) : super(props);
}

class Loading extends TrendingMovieState {}

class Error extends TrendingMovieState {
  final Exception exception;

  Error(this.exception) :super([exception.hashCode]);
}

class Loaded extends TrendingMovieState {
  final List<Movie> movies;

  Loaded({this.movies}) : super([]);
}
