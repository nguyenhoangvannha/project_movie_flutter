import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecommendationMovieEvent extends Equatable {
  RecommendationMovieEvent([List props = const []]) : super(props);
}
