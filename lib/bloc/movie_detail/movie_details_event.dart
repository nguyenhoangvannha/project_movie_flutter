import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  MovieDetailsEvent([List props = const []]) : super(props);
}

class Load extends MovieDetailsEvent {
  final int movieId;

  Load({this.movieId}) :super([movieId]);

}