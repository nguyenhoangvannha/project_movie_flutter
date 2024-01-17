import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarMovieEvent extends Equatable {
  const SimilarMovieEvent() : super();
}

class Fetch extends SimilarMovieEvent {
  final int? movieId;

  const Fetch({required this.movieId}) : super();

  @override
  List<Object> get props => [
        {movieId}
      ];
}
