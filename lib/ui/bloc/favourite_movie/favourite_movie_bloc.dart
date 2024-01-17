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

  FavouriteMovieBloc(
      {@required this.getFavoriteMovie,
      @required this.addFavoriteMovie,
      @required this.updateFavoriteMovie,
      @required this.removeFavoriteMovie})
      : super(LoadingFavorite()) {
    on<LoadFavorite>(_loadFavorite);
    on<CheckFavorite>(_onCheckFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
    on<AddFavorite>(_onAddFavorite);
    on<UpdateFavorite>(_onUpdateFavorite);
  }

  List<Movie> listFavMovie = [];

  FutureOr<void> _loadFavorite(
      LoadFavorite event, Emitter<FavouriteMovieState> emit) async {
    if (listFavMovie != null && listFavMovie.length > 0) {
      emit(
        HasFavorite(
          movies: listFavMovie,
          watching: listFavMovie.where((m) {
            return !m.finished;
          }).toList(),
          finished: listFavMovie.where((m) {
            return m.finished;
          }).toList(),
        ),
      );
    } else {
      emit(LoadingFavorite());
      var res = await getFavoriteMovie.execute(MovieParams());
      switch (res.type) {
        case ResourceType.Error:
          emit(FavoriteError(exception: res.exception));
          break;
        case ResourceType.Success:
          listFavMovie = res.data;
          if (listFavMovie.length > 0)
            emit(HasFavorite(
              movies: listFavMovie,
              watching: listFavMovie.where((m) {
                return !m.finished;
              }).toList(),
              finished: listFavMovie.where((m) {
                return m.finished;
              }).toList(),
            ));
          else
            emit(NoFavorite());
          break;
      }
    }
  }

  FutureOr<void> _onCheckFavorite(
      CheckFavorite event, Emitter<FavouriteMovieState> emit) {
    if (listFavMovie != null &&
        listFavMovie.indexWhere((e) {
              return e.id == event.movieId;
            }) >=
            0) {
      emit(FavoriteChecked(movieId: event.movieId, isFavorite: true));
    } else {
      emit(FavoriteChecked(movieId: event.movieId, isFavorite: false));
    }
  }

  FutureOr<void> _onRemoveFavorite(
      RemoveFavorite event, Emitter<FavouriteMovieState> emit) {
    if (listFavMovie != null &&
        listFavMovie.indexWhere((e) {
              return e.id == event.movieId;
            }) >=
            0) {
      listFavMovie.removeWhere((m) {
        return m.id == event.movieId;
      });
      removeFavoriteMovie.execute(event.movieId);
      add(CheckFavorite(movieId: event.movieId));
      add(LoadFavorite());
    }
  }

  FutureOr<void> _onAddFavorite(
      AddFavorite event, Emitter<FavouriteMovieState> emit) {
    if (listFavMovie != null &&
        listFavMovie.indexWhere((e) {
              return e.id == event.movie.id;
            }) <
            0) {
      listFavMovie.add(event.movie);
      addFavoriteMovie.execute(event.movie);
      add(CheckFavorite(movieId: event.movie.id));
      add(LoadFavorite());
    }
  }

  FutureOr<void> _onUpdateFavorite(
      UpdateFavorite event, Emitter<FavouriteMovieState> emit) {
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
    add(CheckFavorite(movieId: favMovie.id));
    add(LoadFavorite());
  }
}
