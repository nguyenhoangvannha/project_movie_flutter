import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecommendationMovieEvent extends Equatable {
  RecommendationMovieEvent() : super();
}

class Fetch extends RecommendationMovieEvent {
  final int? movieId;

  Fetch({required this.movieId}) : super();
  @override
  List<Object?> get props => [movieId];
}
