import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/respository/entity/movie.dart';
import '../../data/respository/movie_repository.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final MovieRepository repository;
  List<Movie> movies;

  TrendingBloc({@required this.repository});

  @override
  TrendingState get initialState => TrendingLoading();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is Fetch) {
      if (movies == null || movies.length < 1) {
        yield TrendingLoading();
        try {
          movies = await repository.getTrendingMovies();
          if (movies.length < 1) {
            yield TrendingError("No treding movie found");
          } else
            yield TrendingLoaded(
                movies: movies, hasReachedMax: false);
        } catch (e) {
          yield TrendingError(e.toString());
        }
      } else {
        yield TrendingLoaded(movies: movies);
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

  bool _hasReachedMax(TrendingState state) =>
      state is TrendingLoaded && state.hasReachedMax;
}
