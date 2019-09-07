import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/data/respository/movie_repository.dart';

import './bloc.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final MovieRepository repository;
  List<Movie> movies;

  TrendingMovieBloc({@required this.repository});

  @override
  TrendingMovieState get initialState => MovieLoading();

  @override
  Stream<TrendingMovieState> mapEventToState(TrendingMovieEvent event,) async* {
    if (event is Fetch) {
      if (movies == null || movies.length < 1) {
        yield MovieLoading();
        try {
          movies = await repository.getTrendingMovies();
          if (movies.length < 1) {
            yield MovieError("No treding movie found");
          } else
            yield MovieLoaded(movies: movies);
        } catch (e) {
          yield MovieError(e.toString());
        }
      } else {
        yield MovieLoaded(movies: movies);
      }
    }
  }
}
