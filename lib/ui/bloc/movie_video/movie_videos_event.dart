import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieVideosEvent extends Equatable {
  MovieVideosEvent([List props = const <dynamic>[]]) : super(props);
}

class Fetch extends MovieVideosEvent {
  final int movieId;

  Fetch({@required this.movieId}) : super([movieId]);
}
