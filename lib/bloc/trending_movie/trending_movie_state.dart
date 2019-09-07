import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';

@immutable
abstract class TrendingMovieState extends Equatable {
  TrendingMovieState([List props = const []]) : super(props);
}

class MovieLoading extends TrendingMovieState {}

class MovieError extends TrendingMovieState {
  final String message;

  MovieError(this.message) : super([message]);
}

class MovieLoaded extends TrendingMovieState {
  final List<Movie> movies;

  MovieLoaded({this.movies}) : super([]);
}
