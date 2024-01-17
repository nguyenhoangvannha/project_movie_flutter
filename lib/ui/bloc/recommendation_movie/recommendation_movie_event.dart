import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecommendationMovieEvent extends Equatable {
  const RecommendationMovieEvent() : super();
}

class Fetch extends RecommendationMovieEvent {
  final int? movieId;

  const Fetch({required this.movieId}) : super();
  @override
  List<Object?> get props => [movieId];
}
