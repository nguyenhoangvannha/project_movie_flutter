import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent() : super();
}

class Fetch extends TrendingMovieEvent {
  const Fetch();

  @override
  List<Object> get props => [];
}

class LoadMore extends TrendingMovieEvent {
  @override
  List<Object> get props => [];
}
