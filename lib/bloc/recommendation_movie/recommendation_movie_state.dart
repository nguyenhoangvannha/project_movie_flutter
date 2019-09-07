import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecommendationMovieState extends Equatable {
  RecommendationMovieState([List props = const []]) : super(props);
}

class InitialRecommendationMovieState extends RecommendationMovieState {}
