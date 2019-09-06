import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/respository/entity/movie.dart';
import '../../data/respository/movie_repository.dart';

class SimilarBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  List<Movie> movies;
  int _movieId = -1;

  SimilarBloc({@required this.repository});

  @override
  MovieState get initialState => MovieLoading();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event,) async* {
    if (event is Fetch) {
      if (movies == null || movies.length < 1 || _movieId != event.movieId) {
        yield MovieLoading();
        try {
          movies = await repository.similarMovies(movieId: event.movieId);
          if (movies.length < 1) {
            yield MovieError("No treding movie found");
          } else
            yield MovieLoaded(
                movies: movies, hasReachedMax: false);
        } catch (e) {
          yield MovieError(e.toString());
        }
      } else {
        yield MovieLoaded(movies: movies);
      }
    }
  }
}
