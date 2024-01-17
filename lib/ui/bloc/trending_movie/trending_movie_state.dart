import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class TrendingMovieState extends Equatable {
  TrendingMovieState() : super();
}

class Loading extends TrendingMovieState {
  @override
  List<Object> get props => [];
}

class Error extends TrendingMovieState {
  final Object? exception;

  Error(this.exception) : super();
  @override
  List<Object> get props => [exception.hashCode];
}

class Loaded extends TrendingMovieState {
  final List<Movie>? movies;

  Loaded({this.movies}) : super();
  @override
  List<Object> get props => [
        {movies}
      ];
}
