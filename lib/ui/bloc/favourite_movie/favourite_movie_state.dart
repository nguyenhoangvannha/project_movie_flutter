import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

@immutable
abstract class FavouriteMovieState extends Equatable {
  const FavouriteMovieState() : super();

  @override
  List<Object?> get props => [];
}

class LoadingFavorite extends FavouriteMovieState {}

class NoFavorite extends FavouriteMovieState {}

class HasFavorite extends FavouriteMovieState {
  final List<Movie>? movies;
  final List<Movie> watching;
  final List<Movie> finished;

  const HasFavorite(
      {required this.movies, required this.watching, required this.finished});
}

class FavoriteError extends FavouriteMovieState {
  final Object? exception;

  const FavoriteError({required this.exception});
}

class FavoriteChecked extends FavouriteMovieState {
  final int? movieId;
  final bool isFavorite;

  const FavoriteChecked({required this.movieId, required this.isFavorite})
      : super();

  @override
  List<Object?> get props => [movieId, isFavorite];
}
