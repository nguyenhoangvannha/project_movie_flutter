import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SimilarMovieEvent extends Equatable {
  SimilarMovieEvent([List props = const []]) : super(props);
}
