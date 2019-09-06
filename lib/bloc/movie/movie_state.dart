import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/network/model/movie_model.dart';
import '../../data/respository/entity/movie.dart';

@immutable
abstract class MovieState extends Equatable {
  MovieState([List props = const []]) : super(props);
}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message) :super([message]);

}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final bool hasReachedMax;

  MovieLoaded({this.movies, this.hasReachedMax})
      : super([movies, hasReachedMax]);

  MovieLoaded copyWith({List<MovieModel> movies, bool hasReachedMax}) {
    return MovieLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
