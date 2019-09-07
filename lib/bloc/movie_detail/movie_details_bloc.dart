import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/data/respository/movie_repository.dart';

import './bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository repository;
  Movie _movie;

  MovieDetailsBloc({@required this.repository});

  @override
  MovieDetailsState get initialState => Loading();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event,) async* {
    if (event is Load) {
      if (_movie == null || _movie.id != event.movieId) {
        yield Loading();
        try {
          _movie = await repository.getMovieDetail(movieId: event.movieId);
          if (_movie == null) {
            yield NotFound(message: 'Movie not found: id - ${event.movieId}');
          } else {
            yield Result(movie: _movie);
          }
        } catch (ex) {
          yield Error(message: ex.toString());
        }
      } else if (_movie != null && _movie.id == event.movieId) {
        yield Result(movie: _movie);
      }
    } else {
      yield Error(message: 'Unknown');
    }
  }
}
