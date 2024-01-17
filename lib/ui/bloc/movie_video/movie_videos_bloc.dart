import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  final UseCase<List<Video>, MovieParams> getMovieVideos;
  List<Video>? _videos;
  int? movieId;

  MovieVideosBloc({required this.getMovieVideos}) : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  FutureOr<void> _onFetch(Fetch event, Emitter<MovieVideosState> emit) async {
    if (movieId == null || movieId != event.movieId) {
      emit(Loading());
      var res =
          await getMovieVideos.execute(MovieParams(movieId: event.movieId));
      switch (res.type) {
        case ResourceType.Error:
          emit(Error(res.exception));
          break;
        case ResourceType.Success:
          _videos = res.data;
          emit(Result(videos: _videos));
          break;
      }
    } else if (_videos != null && movieId == event.movieId) {
      emit(Result(videos: _videos));
    }
  }
}
