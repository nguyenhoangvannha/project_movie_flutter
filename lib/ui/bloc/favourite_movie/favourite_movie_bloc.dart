import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class FavouriteMovieBloc
    extends Bloc<FavouriteMovieEvent, FavouriteMovieState> {
  final UseCase<List<Movie>, MovieParams> getFavoriteMovie;
  final UseCase<bool, Movie> addFavoriteMovie;
  final UseCase<bool, Movie> updateFavoriteMovie;
  final UseCase<bool, int> removeFavoriteMovie;

  FavouriteMovieBloc({@required this.getFavoriteMovie,
    @required this.addFavoriteMovie,
    @required this.updateFavoriteMovie,
    @required this.removeFavoriteMovie});

  List<Movie> listFavMovie = [];

  @override
  FavouriteMovieState get initialState => LoadingFavorite();

  @override
  Stream<FavouriteMovieState> mapEventToState(
    FavouriteMovieEvent event,
  ) async* {
    if (event is LoadFavorite) {
      if (listFavMovie != null && listFavMovie.length > 0) {
        yield HasFavorite(
          movies: listFavMovie,
          watching: listFavMovie.where((m) {
            return !m.finished;
          }).toList(),
          finished: listFavMovie.where((m) {
            return m.finished;
          }).toList(),
        );
      } else {
        yield LoadingFavorite();
        var res = await getFavoriteMovie.execute(MovieParams());
        switch (res.type) {
          case ResourceType.Error:
            yield FavoriteError(exception: res.exception);
            break;
          case ResourceType.Success:
            listFavMovie = res.data;
            if (listFavMovie.length > 0)
              yield HasFavorite(
                movies: listFavMovie,
                watching: listFavMovie.where((m) {
                  return !m.finished;
                }).toList(),
                finished: listFavMovie.where((m) {
                  return m.finished;
                }).toList(),
              );
            else
              yield NoFavorite();
            break;
        }
      }
    }
    if (event is CheckFavorite) {
      if (listFavMovie != null &&
          listFavMovie.indexWhere((e) {
            return e.id == event.movieId;
          }) >=
              0) {
        yield FavoriteChecked(movieId: event.movieId, isFavorite: true);
      } else {
        yield FavoriteChecked(movieId: event.movieId, isFavorite: false);
      }
    }
    if (event is AddFavorite) {
      if (listFavMovie != null &&
          listFavMovie.indexWhere((e) {
            return e.id == event.movie.id;
          }) <
              0) {
        listFavMovie.add(event.movie);
        addFavoriteMovie.execute(event.movie);
        dispatch(CheckFavorite(movieId: event.movie.id));
        dispatch(LoadFavorite());
      }
    }
    if (event is RemoveFavorite) {
      if (listFavMovie != null &&
          listFavMovie.indexWhere((e) {
            return e.id == event.movieId;
          }) >=
              0) {
        listFavMovie.removeWhere((m) {
          return m.id == event.movieId;
        });
        removeFavoriteMovie.execute(event.movieId);
        dispatch(CheckFavorite(movieId: event.movieId));
        dispatch(LoadFavorite());
      }
    }
    if (event is UpdateFavorite) {
      final eventMovie = event.movie;
      final favMovie = listFavMovie.firstWhere((m) {
        if (m.id == eventMovie.id) {
          m.finished = eventMovie.finished;
          return true;
        } else {
          return false;
        }
      });
      updateFavoriteMovie.execute(favMovie);
      dispatch(CheckFavorite(movieId: favMovie.id));
      dispatch(LoadFavorite());
    }
  }
}
