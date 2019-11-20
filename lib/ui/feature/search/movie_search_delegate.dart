import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/search_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/guide.dart';
import 'package:project_movie_flutter/ui/widget/common/loading_list_placeholder.dart';
import 'package:project_movie_flutter/ui/widget/common/message_view.dart';
import 'package:project_movie_flutter/ui/widget/movies_panel.dart';
import 'package:project_movie_flutter/ui/widget/search_item.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

class MovieSearchDelegate extends SearchDelegate<List<Movie>> {
  //final Debouncer debouncer = Debouncer(milliseconds: 500);
  SearchMovieBloc _searchBloc;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            query = "";
            BlocProvider.of<SearchMovieBloc>(context).dispatch(Search(query));
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return _search(context, Type.Result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (_searchBloc == null)
      _searchBloc = BlocProvider.of<SearchMovieBloc>(context);
    _searchBloc.dispatch(Search(query ?? ""));
    return _search(context, Type.Suggestions);
  }

  Widget _search(BuildContext context, Type type) {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      builder: (bctx, state) {
        if (state is Initial) {
          return Guide();
        }
        if (state is Searching) {
          return LoadingListPlaceHolder();
        }

        if (state is Error) {
          return MessageView(
              message: ExceptionHandler.handle(context, state.exception));
        }
        if (state is Result) {
          if (state.movies.isEmpty) {
            return MessageView(
              message: AppLocalizations.of(context).translate('msg_no_movies'),
            );
          }
          if (type == Type.Suggestions)
            return _buildSuggestionsList(state.movies);
          else {
            return MoviesPanel(state.movies, loadMore:  loadMore,);
          }
        }

        return Container();
      },
    );
  }

  Future<List<Movie>> loadMore(BuildContext context, int page) async {
    return await BlocProvider.of<SearchMovieBloc>(context).loadMore(
        query, page);
  }

  _buildSuggestionsList(List<Movie> movies) {
    final SlidableController slidableController = SlidableController();
    return ListView.separated(
        separatorBuilder: (bCtx, index) {
          return Divider(
            indent: 8,
            endIndent: 8,
            height: 4,
            thickness: 0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return SearchItem(
            movies.elementAt(index),
            slidableController: slidableController,
            onTap: () => AppNavigator.instance
                .showBottomSheetMovieDetails(context, movies.elementAt(index)),
            onLongPress: () => AppNavigator.instance
                .showBottomSheetEditMovie(context, movies.elementAt(index)),
          );
        },
        itemCount: movies.length);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}

enum Type { Result, Suggestions }
