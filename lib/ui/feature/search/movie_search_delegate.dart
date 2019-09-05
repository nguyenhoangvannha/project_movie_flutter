import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/ui/widget/common/bottom_loader.dart';
import 'package:project_movie/ui/widget/common/error_view.dart';
import 'package:project_movie/ui/widget/common/guide.dart';

import '../../../bloc/search/bloc.dart';
import '../../../data/respository/entity/movie.dart';
import '../../../ui/util/debouncer.dart';
import '../../../ui/widget/search_movie_item.dart';

class MovieSearchDelegate extends SearchDelegate<List<Movie>> {
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  SearchBloc _searchBloc = null;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            query = '';
            BlocProvider.of<SearchBloc>(context).dispatch(SearchEmpty());
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    searchBloc.dispatch(ShowResults());
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchResults) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.movies.length
                    ? BottomLoader()
                    : SearchSuggestionItem(movie: state.movies[index]);
              },
              itemCount: state.movies.length);
        }
        if (state is SearchNotFound) {
          return Center(
            child: Text('Not found'),
          );
        }
        return Center(
          child: Text('Unhandled state'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (_searchBloc == null) _searchBloc = BlocProvider.of<SearchBloc>(context);
    return _search();
  }

  Widget _search() {
    if (query.isEmpty) {
      _searchBloc.dispatch(SearchEmpty());
    } else
      _searchBloc.dispatch(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchSuggestions) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SearchSuggestionItem(movie: state.movies[index]);
              },
              itemCount: state.movies.length);
        }
        if (state is SearchUninitialized) {
          return Guide();
        }
        if (state is SearchNotFound) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is SearchError) {
          return Center(
            child: ErrorView(message: state.message),
          );
        }
        return Center(
          child: Text('Unhandled state'),
        );
      },
    );
  }

  @override
  void close(BuildContext context, List result) {
    super.close(context, result);
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
  }

  @override
  void showSuggestions(BuildContext context) {
    super.showSuggestions(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}
