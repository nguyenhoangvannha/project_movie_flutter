import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';
import 'package:project_movie/data/respository/movie_repository.dart';

import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository repository;
  final List<Movie> movies = [];

  SearchBloc({@required this.repository});

  @override
  SearchState get initialState => SearchUninitialized();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event,) async* {
    if (event is Search) {
      try {
        movies.clear();
        dispatch(Searching());
        movies.addAll(await repository.searchMovies(event.query));
        dispatch(ShowSuggestions());
      } catch (ex) {
        yield SearchError(message: ex.toString());
      }
    }

    if (event is Searching) {
      yield Loading();
    }

    if (event is SearchEmpty) {
      yield SearchUninitialized();
      return;
    }

    if (event is ShowSuggestions) {
      if (movies == null || movies.length < 1) {
        yield SearchNotFound(message: "No movie found");
      } else {
        yield SearchSuggestions(movies: movies);
      }
      return;
    }

    if (event is ShowResults) {
      if (movies == null || movies.length < 1) {
        yield SearchNotFound(message: "No movie found");
      } else
        yield SearchResults(movies: movies);
    }
  }
}
