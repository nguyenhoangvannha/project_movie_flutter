import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/network/model/movie_model.dart';
import '../../data/respository/entity/movie.dart';

@immutable
abstract class TrendingState extends Equatable {
  TrendingState([List props = const []]) : super(props);
}

class TrendingUninitialized extends TrendingState {}

class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message) :super([message]);

}

class TrendingLoaded extends TrendingState {
  final List<Movie> movies;
  final bool hasReachedMax;

  TrendingLoaded({this.movies, this.hasReachedMax}) : super([movies, hasReachedMax]);

  TrendingLoaded copyWith({List<MovieModel> movies, bool hasReachedMax}) {
    return TrendingLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
