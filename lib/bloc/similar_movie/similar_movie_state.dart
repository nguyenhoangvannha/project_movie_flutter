import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarMovieState extends Equatable {
  SimilarMovieState([List props = const []]) : super(props);
}

class InitialSimilarMovieState extends SimilarMovieState {}
