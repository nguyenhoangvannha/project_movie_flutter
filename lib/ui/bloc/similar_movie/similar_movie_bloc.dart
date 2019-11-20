import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  final UseCase<List<Movie>, MovieParams> getSimilarMovies;
  List<Movie> movies;
  int movieId;

  SimilarMovieBloc({@required this.getSimilarMovies});

  @override
  SimilarMovieState get initialState => Loading();

  @override
  Stream<SimilarMovieState> mapEventToState(SimilarMovieEvent event,) async* {
    if (event is Fetch) {
      if (movieId == null || movieId != event.movieId) {
        yield Loading();
        var res =
        await getSimilarMovies.execute(MovieParams(movieId: event.movieId));
        switch (res.type) {
          case ResourceType.Error:
            yield Error(res.exception);
            break;
          case ResourceType.Success:
            movies = res.data;
            movieId = event.movieId;
            yield Result(movies: movies);
            break;
        }
      } else if (movies != null) {
        yield Result(movies: movies);
      }
    }
  }
}
