import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/respository/entity/movie.dart';
import '../../data/respository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository repository;
  Movie _movie;

  MovieDetailBloc({@required this.repository});

  @override
  MovieDetailState get initialState => Loading();

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event,) async* {
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
