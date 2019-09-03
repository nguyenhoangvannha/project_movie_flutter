import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/movie_repository.dart';

import './bloc.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final MovieRepository repository;

  TrendingBloc({@required this.repository});

  @override
  TrendingState get initialState => TrendingUninitialized();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TrendingUninitialized) {
          final movies = await repository.getTrendingMovies();
          if (movies.length < 1) {
            yield TrendingError("No treding movie found");
          } else
            yield TrendingLoaded(
                movies: movies, hasReachedMax: false);
          return;
        }
        if (currentState is TrendingLoaded) {
          final movies = await repository.getTrendingMovies();
          yield movies.isEmpty
              ? (currentState as TrendingLoaded).copyWith(hasReachedMax: true)
              : TrendingLoaded(
              movies: (currentState as TrendingLoaded).movies +
                  movies.toList(),
                  hasReachedMax: false);
        }
      } catch (e) {
        yield TrendingError(e.toString());
      }
    }
  }

  bool _hasReachedMax(TrendingState state) =>
      state is TrendingLoaded && state.hasReachedMax;
}
