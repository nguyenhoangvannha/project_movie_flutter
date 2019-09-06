import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/respository/entity/movie.dart';
import '../../data/respository/movie_repository.dart';

class TrendingBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  List<Movie> movies;

  TrendingBloc({@required this.repository});

  @override
  MovieState get initialState => MovieLoading();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event,
  ) async* {
    if (event is Fetch) {
      if (movies == null || movies.length < 1) {
        yield MovieLoading();
        try {
          movies = await repository.getTrendingMovies();
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
//    if (event is LoadMore && !_hasReachedMax(currentState)) {
//      try {
//        if (currentState is TrendingLoading) {
//          movies = await repository.getTrendingMovies();
//          if (movies.length < 1) {
//            yield TrendingError("No treding movie found");
//          } else
//            yield TrendingLoaded(
//                movies: movies, hasReachedMax: false);
//        }
//        if (currentState is TrendingLoaded) {
//          final movies = await repository.getTrendingMovies();
//          yield movies.isEmpty
//              ? (currentState as TrendingLoaded).copyWith(hasReachedMax: true)
//              : TrendingLoaded(
//              movies: (currentState as TrendingLoaded).movies +
//                  movies.toList(),
//                  hasReachedMax: false);
//        }
//      } catch (e) {
//        yield TrendingError(e.toString());
//      }
//    }
  }

  bool _hasReachedMax(MovieState state) =>
      state is MovieLoaded && state.hasReachedMax;
}
