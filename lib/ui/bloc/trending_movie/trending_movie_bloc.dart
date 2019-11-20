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

  TrendingMovieBloc({@required this.getTrendingMovies});

  @override
  TrendingMovieState get initialState => Loading();

  @override
  Stream<TrendingMovieState> mapEventToState(TrendingMovieEvent event,) async* {
    if (event is Fetch) {
      if (movies == null || movies.length < 1) {
        yield Loading();
        var res = await getTrendingMovies.execute(MovieParams());
        switch (res.type) {
          case ResourceType.Error:
            yield (Error(res.exception));
            break;
          case ResourceType.Success:
            movies = res.data;
            yield Loaded(movies: movies);
            break;
        }
      } else {
        yield Loaded(movies: movies);
      }
    }
  }
}
