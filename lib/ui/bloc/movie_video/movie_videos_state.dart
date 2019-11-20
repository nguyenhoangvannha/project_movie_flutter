import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';

@immutable
abstract class MovieVideosState extends Equatable {
  MovieVideosState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends MovieVideosState {}

class Error extends MovieVideosState {
  final Exception exception;

  Error(this.exception) : super([exception]);
}

class Result extends MovieVideosState {
  final List<Video> videos;

  Result({@required this.videos}) : super([videos]);
}
