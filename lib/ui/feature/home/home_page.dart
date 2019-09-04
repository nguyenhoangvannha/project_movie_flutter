import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/favorite/bloc.dart';
import 'package:project_movie/ui/widget/common/loading_indicator.dart';
import 'package:project_movie/ui/widget/common/search_guide.dart';
import 'package:project_movie/ui/widget/common/unknow_state.dart';
import 'package:project_movie/ui/widget/trending.dart';

import '../../../ui/feature/search/movie_search_delegate.dart';

class HomePage extends StatelessWidget {
  FavoriteBloc _favoriteBloc;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    if (_favoriteBloc == null)
      _favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    _favoriteBloc.dispatch(LoadFavorite());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle),
        title: Center(
            child: Text(
              'The Movie Db',
              textAlign: TextAlign.center,
            )),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MovieSearchDelegate());
              })
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state is InitialFavoriteState) {
          return SearchGuide();
        }

        if (state is LoadingFavorite) {
          return LoadingIndicator();
        }
        if (state is NoFavorite) {
          return Trending();
        }

        if (state is HasFavorite) {
          return _buildTabView(context, mediaQueryData);
        }
        return UnknownState();
      }),
    );
  }

  Widget _buildTabView(BuildContext context, MediaQueryData mediaQueryData) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQueryData.orientation == Orientation.portrait
                  ? mediaQueryData.size.height * 0.05
                  : mediaQueryData.size.height * 0.08,
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Watching',
                  ),
                  Tab(
                    text: 'Finished',
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [
                  Container(),
                  Container(),
//              MoviesPanel(MovieType.watching),
//              MoviesPanel(MovieType.finished)
                ]))
          ],
        ));
  }
}
