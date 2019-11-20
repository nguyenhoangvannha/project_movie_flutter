import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class FavouriteMovieEvent extends Equatable {
  FavouriteMovieEvent([List props = const []]) : super(props);
}

class LoadFavorite extends FavouriteMovieEvent {}

class CheckFavorite extends FavouriteMovieEvent {
  final int movieId;

  CheckFavorite({@required this.movieId}) : super([movieId]);
}

class AddFavorite extends FavouriteMovieEvent {
  final Movie movie;

  AddFavorite({@required this.movie}) : super([movie]);
}

class RemoveFavorite extends FavouriteMovieEvent {
  final int movieId;

  RemoveFavorite({@required this.movieId}) : super([movieId]);
}

class UpdateFavorite extends FavouriteMovieEvent {
  final Movie movie;

  UpdateFavorite({@required this.movie});
}
