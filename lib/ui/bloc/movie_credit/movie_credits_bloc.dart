import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class MovieCreditsBloc extends Bloc<MovieCreditsEvent, MovieCreditsState> {
  final UseCase<List<Cast>, MovieParams> getMovieCredits;
  List<Cast>? casts;
  int? movieId;

  MovieCreditsBloc({required this.getMovieCredits}) : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  FutureOr<void> _onFetch(Fetch event, Emitter<MovieCreditsState> emit) async {
    if (movieId == null || movieId != event.movieId) {
      var res =
          await getMovieCredits.execute(MovieParams(movieId: event.movieId));
      switch (res.type) {
        case ResourceType.Error:
          emit(Error(res.exception));
          break;
        case ResourceType.Success:
          casts = res.data;
          movieId = event.movieId;
          emit(Loaded(casts: casts));
          break;
      }
    } else {
      emit(Loaded(casts: casts));
    }
  }
}
