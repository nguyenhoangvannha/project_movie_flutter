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
  List<Video> _videos;
  int movieId;

  MovieVideosBloc({@required this.getMovieVideos});

  @override
  MovieVideosState get initialState => Loading();

  @override
  Stream<MovieVideosState> mapEventToState(
    MovieVideosEvent event,
  ) async* {
    if (event is Fetch) {
      if (movieId == null || movieId != event.movieId) {
        yield Loading();
        var res =
            await getMovieVideos.execute(MovieParams(movieId: event.movieId));
        switch (res.type) {
          case ResourceType.Error:
            yield Error(res.exception);
            break;
          case ResourceType.Success:
            _videos = res.data;
            yield Result(videos: _videos);
            break;
        }
      } else if (_videos != null && movieId == event.movieId) {
        yield Result(videos: _videos);
      }
    }
  }
}
