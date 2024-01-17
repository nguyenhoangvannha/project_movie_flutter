import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class SearchMovieState extends Equatable {
  const SearchMovieState() : super();

  @override
  List<Object?> get props => [];
}

class Initial extends SearchMovieState {}

class Searching extends SearchMovieState {}

class Error extends SearchMovieState {
  final Object? exception;

  const Error(this.exception) : super();

  @override
  List<Object> get props => [exception.hashCode];
}

class Result extends SearchMovieState {
  final List<Movie>? movies;

  const Result({required this.movies}) : super();

  @override
  List<Object?> get props => [movies];
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
