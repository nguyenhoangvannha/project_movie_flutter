import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final UseCase<List<Movie>, MovieParams> searchMovie;

  SearchMovieBloc({@required this.searchMovie});

  @override
  SearchMovieState get initialState => Initial();

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is Search) {
      if (event.query.isEmpty) {
        yield Initial();
      } else {
        yield Searching();
        var res = await searchMovie
            .execute(MovieParams(query: event.query, page: event.page));
        switch (res.type) {
          case ResourceType.Error:
            yield Error(res.exception);
            break;
          case ResourceType.Success:
            yield Result(movies: res.data);
            break;
        }
      }
    }
//    if (event is LoadMore) {
//      if (event.query.isEmpty) {
//        yield LoadMoreResult(movies: []);
//      } else {
//        yield LoadMoreProcessing();
//        var res = await searchMovie
//            .execute(MovieParams(query: event.query, page: event.page));
//        switch (res.type) {
//          case ResourceType.Error:
//            yield Error(res.exception);
//            break;
//          case ResourceType.Success:
//            yield LoadMoreResult(movies: res.data);
//            break;
//        }
//      }
//    }
  }

  Future<List<Movie>> loadMore(String query, int page) async {
    var res = await searchMovie.execute(MovieParams(query: query, page: page));
    var data = [];
    switch (res.type) {
      case ResourceType.Error:
        break;
      case ResourceType.Success:
        data = res.data;
        break;
    }
    return data;
  }
}
