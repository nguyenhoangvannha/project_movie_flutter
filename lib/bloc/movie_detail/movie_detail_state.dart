import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/respository/entity/movie.dart';

@immutable
abstract class MovieDetailState extends Equatable {
  MovieDetailState([List props = const []]) : super(props);
}

class Loading extends MovieDetailState {
}

class NotFound extends MovieDetailState {
  final String message;

  NotFound({this.message = ''}) :super([message]);

}

class Error extends MovieDetailState {
  final String message;

  Error({this.message = ''}) :super([message]);

}

class Result extends MovieDetailState {
  final Movie movie;

  Result({@required this.movie}) :super([movie]);
}


