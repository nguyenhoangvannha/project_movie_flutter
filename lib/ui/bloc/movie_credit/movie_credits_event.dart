import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieCreditsEvent extends Equatable {
  MovieCreditsEvent([List props = const []]) : super(props);
}

class Fetch extends MovieCreditsEvent {
  final int movieId;

  Fetch({@required this.movieId}) : super([movieId]);
}
