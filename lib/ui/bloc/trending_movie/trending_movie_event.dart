import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingMovieEvent extends Equatable {
  TrendingMovieEvent() : super();
}

class Fetch extends TrendingMovieEvent {
  Fetch();

  @override
  List<Object> get props => [];
}

class LoadMore extends TrendingMovieEvent {
  @override
  List<Object> get props => [];
}
