import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingMovieEvent extends Equatable {
  TrendingMovieEvent([List props = const []]) : super(props);
}

class Fetch extends TrendingMovieEvent {
  final int movieId;

  Fetch({this.movieId = -1});
}

class LoadMore extends TrendingMovieEvent {}