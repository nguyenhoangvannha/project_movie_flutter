import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class SimilarMovieState extends Equatable {
  SimilarMovieState() : super();

  @override
  List<Object> get props => [];
}

class Loading extends SimilarMovieState {}

class Error extends SimilarMovieState {
  final Exception exception;

  Error(this.exception) : super();

  @override
  List<Object> get props => [exception.hashCode];
}

class Result extends SimilarMovieState {
  final List<Movie> movies;

  Result({@required this.movies}) : super();

  @override
  List<Object> get props => [movies];
}
