import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final UseCase<Movie, MovieParams> getMovieDetails;
  Movie _movie;

  MovieDetailsBloc({@required this.getMovieDetails}) : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  FutureOr<void> _onFetch(Fetch event, Emitter<MovieDetailsState> emit) async {
    if (_movie == null || _movie.id != event.movieId) {
      emit(Loading());
      var res =
          await getMovieDetails.execute(MovieParams(movieId: event.movieId));

      switch (res.type) {
        case ResourceType.Error:
          emit(Error(res.exception));
          break;
        case ResourceType.Success:
          _movie = res.data;
          emit(Result(movie: _movie));
          break;
      }
    } else if (_movie != null && _movie.id == event.movieId) {
      emit(Result(movie: _movie));
    }
  }
}
