import 'package:flutter/material.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/util/movie_sort_type.dart';
import 'package:project_movie_flutter/util/sort_util.dart';
import 'package:synchronized/synchronized.dart';

import 'common/guide.dart';
import 'movie_grid.dart';
import 'movie_list_ver.dart';

class MoviesPanel extends StatefulWidget {
  final List<Movie> movies;
  final Future<List<Movie>> Function(BuildContext context, int page) loadMore;

  MoviesPanel(this.movies, {this.loadMore});

  @override
  _MoviesPanelState createState() => _MoviesPanelState();
}

class _MoviesPanelState extends State<MoviesPanel> {
  bool _isGrid = false;
  SortType _sortType;
  int currentPage = 1;
  bool noMore = false;
  bool loading = false;

  void _changeViewType() {
    setState(() {
      _isGrid = !_isGrid;
    });
  }

  void _changeSortType(SortType newSortType) {
    SortUtil.sortListMovie(widget.movies, newSortType);
    setState(() {
      _sortType = newSortType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.movies.length < 1
        ? Guide()
        : _buildContent(context, widget.movies);
  }

  Widget _buildContent(BuildContext context, List<Movie> movies) {
    final translator = AppLocalizations.of(context);
    return Column(
      children: <Widget>[
        OutlineButton(
          onPressed: null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () => AppNavigator.instance.showBottomSheetShortMovies(
                    context,
                    _sortType,
                    (newSortType) => _changeSortType(newSortType)),
                child: Row(
                  children: <Widget>[
                    Text(translator.translate('title_sort')),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              IconButton(
                icon: Icon(_isGrid ? Icons.list : Icons.apps),
                onPressed: _changeViewType,
              )
            ],
          ),
        ),
        Expanded(
          child: _isGrid
              ? MovieGrid(
                  movies: movies,
                  onEndList: _onEndList,
                )
              : MoviesListVer(
                  movies: movies,
                  onEndList: _onEndList,
                ),
        ),
        if (loading) LinearProgressIndicator()
      ],
    );
  }

  final _lock = new Lock();

  _onEndList() async {
    if (widget.loadMore != null)
      await _lock.synchronized(() async {
        if (!noMore) {
          setState(() {
            loading = true;
          });
          final res = await widget.loadMore(context, currentPage + 1);
          if (res.isNotEmpty) {
            currentPage++;
            setState(() {
              widget.movies.addAll(res);
            });
          } else {
            noMore = true;
          }
          setState(() {
            loading = false;
          });
        }
      });
  }
}
