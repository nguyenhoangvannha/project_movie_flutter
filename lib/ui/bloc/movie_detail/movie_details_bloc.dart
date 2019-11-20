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

  MovieDetailsBloc({@required this.getMovieDetails});

  @override
  MovieDetailsState get initialState => Loading();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event,) async* {
    if (event is Fetch) {
      if (_movie == null || _movie.id != event.movieId) {
        yield Loading();
        var res =
        await getMovieDetails.execute(MovieParams(movieId: event.movieId));

        switch (res.type) {
          case ResourceType.Error:
            yield Error(res.exception);
            break;
          case ResourceType.Success:
            _movie = res.data;
            yield Result(movie: _movie);
            break;
        }
      } else if (_movie != null && _movie.id == event.movieId) {
        yield Result(movie: _movie);
      }
    }
  }
}
