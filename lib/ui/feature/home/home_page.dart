import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/favorite/bloc.dart';

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
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      if (state is InitialFavoriteState) {
        return Guide();
      }

      if (state is LoadingFavorite) {
        return LoadingIndicator();
      }
      if (state is NoFavorite) {
        return Column(
          children: <Widget>[Guide(), Expanded(child: Trending())],
        );
      }

      if (state is HasFavorite) {
        return _buildTabView(context, mediaQueryData);
      }
      return ErrorView();
    });
  }
}
