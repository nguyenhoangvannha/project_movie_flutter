import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class RecommendationMovieBloc
    extends Bloc<RecommendationMovieEvent, RecommendationMovieState> {
  final UseCase<List<Movie>, MovieParams> getRecommendationMovie;
  List<Movie>? movies;
  int? movieId;

  RecommendationMovieBloc({required this.getRecommendationMovie})
      : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  FutureOr<void> _onFetch(
      Fetch event, Emitter<RecommendationMovieState> emit) async {
    if (movieId == null || movieId != event.movieId) {
      emit(Loading());
      var res = await getRecommendationMovie
          .execute(MovieParams(movieId: event.movieId));
      switch (res.type) {
        case ResourceType.Error:
          emit(Error(res.exception));
          break;
        case ResourceType.Success:
          movies = res.data;
          movieId = event.movieId;
          emit(Result(movies: movies));
          break;
      }
    } else if (movies != null) {
      emit(Result(movies: movies));
    }
  }
}
