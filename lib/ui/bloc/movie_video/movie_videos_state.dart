import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';

@immutable
abstract class MovieVideosState extends Equatable {
  const MovieVideosState() : super();

  @override
  List<Object?> get props => [];
}

class Loading extends MovieVideosState {}

class Error extends MovieVideosState {
  final Object? exception;

  const Error(this.exception) : super();

  @override
  List<Object?> get props => [exception];
}

class Result extends MovieVideosState {
  final List<Video>? videos;

  const Result({required this.videos}) : super();

  @override
  List<Object?> get props => [videos];
}
