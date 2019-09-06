import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/respository/entity/movie.dart';
import '../../data/respository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository repository;

  MovieDetailBloc({@required this.repository});

  @override
  MovieDetailState get initialState => Loading();

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event,) async* {
    if (event is Load) {
      try {
        Movie _movie = await repository.getMovieDetail(movieId: event.movieId);
        if (_movie == null) {
          yield NotFound(message: 'Movie not found: id - ${event.movieId}');
        } else {
          yield Result(movie: _movie);
          return;
        }
      } catch (ex) {
        yield Error(message: ex.toString());
      }
    } else {
      yield Error(message: 'Unknown');
    }
  }
}
