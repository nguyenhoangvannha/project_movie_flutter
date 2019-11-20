import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class RecommendationMovieState extends Equatable {
  RecommendationMovieState([List props = const []]) : super(props);
}

class Loading extends RecommendationMovieState {
}

class Error extends RecommendationMovieState {
  final Exception exception;

  Error(this.exception) :super([exception.hashCode]);

}

class Result extends RecommendationMovieState {
  final List<Movie> movies;

  Result({@required this.movies}) :super([movies]);
}

