import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  MovieDetailsEvent([List props = const []]) : super(props);
}

class Fetch extends MovieDetailsEvent {
  final int movieId;

  Fetch({@required this.movieId}) :super([movieId]);

}