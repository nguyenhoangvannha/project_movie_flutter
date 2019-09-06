import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/favorite/bloc.dart';
import 'package:project_movie/data/respository/entity/movie.dart';
import 'package:project_movie/ui/widget/common/movie_grid.dart';

import '../../../global/navigation.dart' as Navs;
import '../../../ui/feature/search/movie_search_delegate.dart';
import '../../widget/common/error_view.dart';
import '../../widget/common/guide.dart';
import '../../widget/common/loading_indicator.dart';
import '../../widget/trending.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoriteBloc>(context).dispatch(LoadFavorite());

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(context),
    );
  }

  Widget _buildTabView(BuildContext context, MediaQueryData mediaQueryData,
      List<Movie> movies) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQueryData.orientation == Orientation.portrait
                  ? mediaQueryData.size.height * 0.06
                  : mediaQueryData.size.height * 0.08,
              child: TabBar(
                tabs: [
                  Tab(
                    //text: 'Watching',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.remove_red_eye),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Watching',
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.done_outline),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Finished')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [
                  MovieGrid(
                    movies: movies,
                  ),
                  MovieGrid(
                    movies: movies,
                  ),
                ]))
          ],
        ));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          Navs.showSetting(context);
        },
      ),
      title: Center(
          child: Text(
            'The Movie Db',
          )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            })
      ],
    );
  }

  _buildContent(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FavoriteBloc, FavoriteState>(condition: (pre, next) {
      return next is LoadingFavorite ||
          next is NoFavorite ||
          next is HasFavorite ||
          next is FavoriteError;
    }, builder: (context, state) {
      if (state is LoadingFavorite) {
        return LoadingIndicator();
      }
      if (state is NoFavorite) {
        return Column(
          children: <Widget>[Guide(), Expanded(child: Trending())],
        );
      }

      if (state is HasFavorite) {
        return _buildTabView(context, mediaQueryData, state.movies);
      }

      if (state is FavoriteError) {
        return ErrorView(
          message: state.message,
        );
      }
      return ErrorView();
    });
  }
}
