import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';

@immutable
abstract class MovieDetailsState extends Equatable {
  MovieDetailsState([List props = const []]) : super(props);
}

class Loading extends MovieDetailsState {
}

class NotFound extends MovieDetailsState {
  final String message;

  NotFound({this.message = ''}) :super([message]);

}

class Error extends MovieDetailsState {
  final String message;

  Error({this.message = ''}) :super([message]);

}

class Result extends MovieDetailsState {
  final Movie movie;

  Result({@required this.movie}) :super([movie.id]);
}
