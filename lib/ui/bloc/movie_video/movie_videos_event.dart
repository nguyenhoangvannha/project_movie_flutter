import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieVideosEvent extends Equatable {
  const MovieVideosEvent() : super();
}

class Fetch extends MovieVideosEvent {
  final int? movieId;

  const Fetch({required this.movieId}) : super();

  @override
  List<Object?> get props => [movieId];
}
