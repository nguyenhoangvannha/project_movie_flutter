import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchMovieState extends Equatable {
  SearchMovieState([List props = const []]) : super(props);
}

class InitialSearchMovieState extends SearchMovieState {}
