import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingMovieEvent extends Equatable {
  TrendingMovieEvent([List props = const []]) : super(props);
}

class Fetch extends TrendingMovieEvent {
  Fetch();
}

class LoadMore extends TrendingMovieEvent {}