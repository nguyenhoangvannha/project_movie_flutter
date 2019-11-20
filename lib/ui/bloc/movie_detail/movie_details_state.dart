import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class MovieDetailsState extends Equatable {
  MovieDetailsState([List props = const []]) : super(props);
}

class Loading extends MovieDetailsState {
}

class Error extends MovieDetailsState {
  final Exception exception;

  Error(this.exception) :super([exception.runtimeType]);

}

class Result extends MovieDetailsState {
  final Movie movie;

  Result({@required this.movie}) :super([movie.id]);
}
