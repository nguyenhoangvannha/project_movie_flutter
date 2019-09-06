import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

@immutable
abstract class FavoriteState extends Equatable {
  FavoriteState([List props = const []]) : super(props);
}

class LoadingFavorite extends FavoriteState {}

class NoFavorite extends FavoriteState {}

class HasFavorite extends FavoriteState {
  final List<Movie> movies;

  HasFavorite({@required this.movies});

}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError({@required this.message});

}

class FavoriteChecked extends FavoriteState {
  final int movieId;
  final bool isFavorite;

  FavoriteChecked({@required this.movieId, @required this.isFavorite})
      :super([movieId, isFavorite]);
}