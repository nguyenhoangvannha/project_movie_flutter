import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarMovieEvent extends Equatable {
  SimilarMovieEvent([List props = const []]) : super(props);
}

class Fetch extends SimilarMovieEvent {
  final int movieId;

  Fetch({@required this.movieId}) : super([movieId]);
}