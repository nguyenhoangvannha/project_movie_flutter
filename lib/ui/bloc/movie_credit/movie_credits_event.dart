import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieCreditsEvent extends Equatable {
  MovieCreditsEvent() : super();
}

class Fetch extends MovieCreditsEvent {
  final int movieId;

  Fetch({@required this.movieId}) : super();

  @override
  List<Object> get props => [movieId];
}
