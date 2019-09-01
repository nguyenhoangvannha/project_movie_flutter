import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/model/Movie.dart';

@immutable
abstract class TrendingState extends Equatable {
  TrendingState([List props = const []]) : super(props);
}

class TrendingUninitialized extends TrendingState {}

class TrendingError extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<Movie> movies;
  final bool hasReachedMax;

  TrendingLoaded({this.movies, this.hasReachedMax}) : super([movies, hasReachedMax]);

  TrendingLoaded copyWith({List<Movie> movies, bool hasReachedMax}) {
    return TrendingLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
