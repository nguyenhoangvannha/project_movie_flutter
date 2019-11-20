import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class SearchMovieState extends Equatable {
  SearchMovieState([List props = const []]) : super(props);
}

class Initial extends SearchMovieState {}


class Searching extends SearchMovieState {
}

class Error extends SearchMovieState {
  final Exception exception;

  Error(this.exception) :super([exception.hashCode]);

}

class Result extends SearchMovieState {
  final List<Movie> movies;

  Result({@required this.movies}) :super([movies]);
}
//
//class LoadMoreProcessing extends SearchMovieState {
//  LoadMoreProcessing() :super([]);
//}
//
//class LoadMoreResult extends SearchMovieState {
//  final List<Movie> movies;
//  LoadMoreResult({this.movies}) :super([]);
//}
