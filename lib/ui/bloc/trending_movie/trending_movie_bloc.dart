import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final UseCase<List<Movie>, MovieParams> getTrendingMovies;
  List<Movie> movies;

  TrendingMovieBloc({@required this.getTrendingMovies}) : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  FutureOr<void> _onFetch(Fetch event, Emitter<TrendingMovieState> emit) async {
    if (movies == null || movies.length < 1) {
      emit(Loading());
      var res = await getTrendingMovies.execute(MovieParams());
      switch (res.type) {
        case ResourceType.Error:
          emit((Error(res.exception)));
          break;
        case ResourceType.Success:
          movies = res.data;
          emit(Loaded(movies: movies));
          break;
      }
    } else {
      emit(Loaded(movies: movies));
    }
  }
}
