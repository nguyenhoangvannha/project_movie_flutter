import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class FavouriteMovieEvent extends Equatable {
  FavouriteMovieEvent() : super();
}

class LoadFavorite extends FavouriteMovieEvent {
  @override
  List<Object> get props => [];
}

class CheckFavorite extends FavouriteMovieEvent {
  final int movieId;

  CheckFavorite({@required this.movieId}) : super();

  @override
  List<Object> get props => [movieId];
}

class AddFavorite extends FavouriteMovieEvent {
  final Movie movie;

  AddFavorite({@required this.movie}) : super();

  @override
  List<Object> get props => [movie];
}

class RemoveFavorite extends FavouriteMovieEvent {
  final int movieId;

  RemoveFavorite({@required this.movieId}) : super();

  @override
  List<Object> get props => [movieId];
}

class UpdateFavorite extends FavouriteMovieEvent {
  final Movie movie;

  UpdateFavorite({@required this.movie});

  @override
  List<Object> get props => [];
}
