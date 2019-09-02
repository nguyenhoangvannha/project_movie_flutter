import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  MovieDetailEvent([List props = const []]) : super(props);
}
