import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

import './bloc.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final UseCase<List<Movie>, MovieParams> searchMovie;

  SearchMovieBloc({required this.searchMovie}) : super(Initial()) {
    on<Search>(_onSearch);
  }

  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
//    if (event is LoadMore) {
//      if (event.query.isEmpty) {
//        emit( LoadMoreResult(movies: []);
//      } else {
//        emit( LoadMoreProcessing();
//        var res = await searchMovie
//            .execute(MovieParams(query: event.query, page: event.page));
//        switch (res.type) {
//          case ResourceType.Error:
//            emit( Error(res.exception);
//            break;
//          case ResourceType.Success:
//            emit( LoadMoreResult(movies: res.data);
//            break;
//        }
//      }
//    }
  }

  Future<List<Movie>?> loadMore(String query, int page) async {
    var res = await searchMovie.execute(MovieParams(query: query, page: page));
    List<dynamic>? data = [];
    switch (res.type) {
      case ResourceType.Error:
        break;
      case ResourceType.Success:
        data = res.data;
        break;
    }
    return data as FutureOr<List<Movie>?>;
  }

  FutureOr<void> _onSearch(Search event, Emitter<SearchMovieState> emit) async {
    if (event.query.isEmpty) {
      emit(Initial());
    } else {
      emit(Searching());
      var res = await searchMovie
          .execute(MovieParams(query: event.query, page: event.page));
      switch (res.type) {
        case ResourceType.Error:
          emit(Error(res.exception));
          break;
        case ResourceType.Success:
          emit(Result(movies: res.data));
          break;
      }
    }
  }
}
