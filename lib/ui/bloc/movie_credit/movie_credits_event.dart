import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieCreditsEvent extends Equatable {
  const MovieCreditsEvent() : super();
}

class Fetch extends MovieCreditsEvent {
  final int? movieId;

  const Fetch({required this.movieId}) : super();

  @override
  List<Object?> get props => [movieId];
}
