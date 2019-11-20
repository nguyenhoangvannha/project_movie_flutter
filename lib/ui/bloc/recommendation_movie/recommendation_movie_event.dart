import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecommendationMovieEvent extends Equatable {
  RecommendationMovieEvent([List props = const []]) : super(props);
}

class Fetch extends RecommendationMovieEvent {
  final int movieId;

  Fetch({@required this.movieId}) : super([movieId]);
}