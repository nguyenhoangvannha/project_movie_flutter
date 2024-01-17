import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent() : super();
}

class Fetch extends MovieDetailsEvent {
  final int? movieId;

  const Fetch({required this.movieId}) : super();
  @override
  List<Object?> get props => [movieId];
}
