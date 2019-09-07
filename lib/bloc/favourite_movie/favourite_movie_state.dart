import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavouriteMovieState extends Equatable {
  FavouriteMovieState([List props = const []]) : super(props);
}

class InitialFavouriteMovieState extends FavouriteMovieState {}
