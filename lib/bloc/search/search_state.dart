import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

@immutable
abstract class SearchState extends Equatable {
  SearchState([List props = const []]) : super(props);
}

class SearchUninitialized extends SearchState {}

class SearchNotFound extends SearchState {
  final String message;

  SearchNotFound({this.message});
}

class SearchError extends SearchState {
  final String message;

  SearchError({this.message});
}

class Loading extends SearchState {}

class SearchSuggestions extends SearchState {
  final List<Movie> movies;

  SearchSuggestions({this.movies});

  SearchSuggestions copyWith({List<Movie> movies, bool hasReachedMax}) {
    return SearchSuggestions(movies: movies ?? this.movies);
  }
}

class SearchResults extends SearchState {
  final List<Movie> movies;

  SearchResults({this.movies});

  SearchResults copyWith({List<Movie> movies, bool hasReachedMax}) {
    return SearchResults(movies: movies ?? this.movies);
  }
}
