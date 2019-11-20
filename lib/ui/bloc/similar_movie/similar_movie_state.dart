import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class SimilarMovieState extends Equatable {
  SimilarMovieState([List props = const []]) : super(props);
}


class Loading extends SimilarMovieState {
}

class Error extends SimilarMovieState {
  final Exception exception;

  Error(this.exception) :super([exception.hashCode]);

}

class Result extends SimilarMovieState {
  final List<Movie> movies;

  Result({@required this.movies}) :super([movies]);
}
