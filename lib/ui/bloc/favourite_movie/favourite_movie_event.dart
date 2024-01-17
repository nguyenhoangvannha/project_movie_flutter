import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class FavouriteMovieEvent extends Equatable {
  const FavouriteMovieEvent() : super();
}

class LoadFavorite extends FavouriteMovieEvent {
  @override
  List<Object> get props => [];
}

class CheckFavorite extends FavouriteMovieEvent {
  final int? movieId;

  const CheckFavorite({required this.movieId}) : super();

  @override
  List<Object?> get props => [movieId];
}

class AddFavorite extends FavouriteMovieEvent {
  final Movie movie;

  const AddFavorite({required this.movie}) : super();

  @override
  List<Object> get props => [movie];
}

class RemoveFavorite extends FavouriteMovieEvent {
  final int? movieId;

  const RemoveFavorite({required this.movieId}) : super();

  @override
  List<Object?> get props => [movieId];
}

class UpdateFavorite extends FavouriteMovieEvent {
  final Movie movie;

  const UpdateFavorite({required this.movie});

  @override
  List<Object> get props => [];
}
