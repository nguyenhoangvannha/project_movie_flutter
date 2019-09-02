import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailState extends Equatable {
  MovieDetailState([List props = const []]) : super(props);
}

class InitialMovieDetailState extends MovieDetailState {}
