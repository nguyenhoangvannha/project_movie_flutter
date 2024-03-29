import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class RecommendationMovieState extends Equatable {
  const RecommendationMovieState() : super();

  @override
  List<Object?> get props => [];
}

class Loading extends RecommendationMovieState {}

class Error extends RecommendationMovieState {
  final Object? exception;

  const Error(this.exception) : super();

  @override
  List<Object> get props => [exception.hashCode];
}

class Result extends RecommendationMovieState {
  final List<Movie>? movies;

  const Result({required this.movies}) : super();

  @override
  List<Object?> get props => [movies];
}
