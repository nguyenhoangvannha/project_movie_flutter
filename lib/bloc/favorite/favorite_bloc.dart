import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

import './bloc.dart';
import '../../data/respository/movie_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final MovieRepository repository;

  FavoriteBloc({@required this.repository});

  List<Movie> movies;

  @override
  FavoriteState get initialState => LoadingFavorite();

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is LoadFavorite) {
      if (movies != null && movies.length > 0) {
        yield HasFavorite(movies: movies);
      } else {
        try {
          yield LoadingFavorite();
          movies = await repository.getFavoriteMovies();
          if (movies.length > 0) {
            yield HasFavorite(movies: movies);
          } else {
            yield NoFavorite();
          }
        } catch (ex) {
          yield FavoriteError(message: ex.toString());
        }
      }
    }
    if (event is CheckFavorite) {
      if (movies != null &&
          movies.indexWhere((e) {
            return e.id == event.movieId;
          }) >=
              0) {
        yield FavoriteChecked(movieId: event.movieId, isFavorite: true);
      } else {
        yield FavoriteChecked(movieId: event.movieId, isFavorite: false);
      }
    }
    if (event is AddFavorite) {
      if (movies != null &&
          movies.indexWhere((e) {
            return e.id == event.movie.id;
          }) <
              0) {
        movies.add(event.movie);
        dispatch(CheckFavorite(movieId: event.movie.id));
        dispatch(LoadFavorite());
      }
    }
    if (event is RemoveFavorite) {
      if (movies != null &&
          movies.indexWhere((e) {
            return e.id == event.movieId;
          }) >=
              0) {
        movies.removeWhere((m) {
          return m.id == event.movieId;
        });
        dispatch(CheckFavorite(movieId: event.movieId));
        dispatch(LoadFavorite());
      }
    }
  }
}
