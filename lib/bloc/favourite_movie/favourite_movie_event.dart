import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavouriteMovieEvent extends Equatable {
  FavouriteMovieEvent([List props = const []]) : super(props);
}
