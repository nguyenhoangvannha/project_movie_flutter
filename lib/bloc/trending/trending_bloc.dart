import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/model/Movie.dart';
import 'package:project_movie/data/rest_client.dart';
import './bloc.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final RestClient restClient;

  TrendingBloc({@required this.restClient});

  @override
  TrendingState get initialState => TrendingUninitialized();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TrendingUninitialized) {
          final movies = await _fetchMovies();
          yield TrendingLoaded(movies: movies, hasReachedMax: false);
          return;
        }
        if (currentState is TrendingLoaded) {
          final movies = await _fetchMovies();
          yield movies.isEmpty
              ? (currentState as TrendingLoaded).copyWith(hasReachedMax: true)
              : TrendingLoaded(
              movies: (currentState as TrendingLoaded).movies + movies,
                  hasReachedMax: false);
        }
      } catch (e) {
        print('ERRORR ' + e.toString());
        yield TrendingError();
      }
    }
  }

  bool _hasReachedMax(TrendingState state) =>
      state is TrendingLoaded && state.hasReachedMax;

  Future<List<Movie>> _fetchMovies() async {
    Response response = await restClient.getPopularMovies();
    if (response.statusCode == 200) {
      final data = (response.data)['results'] as List;
      return data.map((rawMovie) {
        return Movie.fromJson(rawMovie);
      }).toList();
    } else {
      throw Exception('Error fetching posts');
    }
  }
}
