import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieEvent extends Equatable {
  MovieEvent([List props = const []]) : super(props);
}

class Fetch extends MovieEvent {
  final int movieId;

  Fetch({this.movieId = -1});
}

class LoadMore extends MovieEvent {}
