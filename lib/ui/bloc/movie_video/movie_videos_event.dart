import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieVideosEvent extends Equatable {
  MovieVideosEvent() : super();
}

class Fetch extends MovieVideosEvent {
  final int? movieId;

  Fetch({required this.movieId}) : super();

  @override
  List<Object?> get props => [movieId];
}
