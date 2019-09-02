import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/network/trending_api_service.dart';

import './bloc.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingApiService service;

  TrendingBloc({@required this.service});

  @override
  TrendingState get initialState => TrendingUninitialized();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TrendingUninitialized) {
          final response = await service.getTrendingMovies();
          if (response.body.movies.length < 1) {
            yield TrendingError("No treding movie found");
          } else
            yield TrendingLoaded(
                movies: response.body.movies.toList(), hasReachedMax: false);
          return;
        }
        if (currentState is TrendingLoaded) {
          final response = await service.getTrendingMovies();
          yield response.body.movies.isEmpty
              ? (currentState as TrendingLoaded).copyWith(hasReachedMax: true)
              : TrendingLoaded(
              movies: (currentState as TrendingLoaded).movies +
                  response.body.movies.toList(),
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
