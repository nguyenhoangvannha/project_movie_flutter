import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/loading_list_placeholder.dart';
import 'package:project_movie_flutter/ui/widget/common/message_view.dart';
import 'package:project_movie_flutter/ui/widget/movies_panel.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import '../../widget/trending_movie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    BlocProvider.of<FavouriteMovieBloc>(context).add(LoadFavorite());

    return BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
        buildWhen: (pre, next) {
      return next is LoadingFavorite ||
          next is NoFavorite ||
          next is HasFavorite ||
          next is FavoriteError;
    }, builder: (context, state) {
      if (state is NoFavorite) {
        return _buildScaffold(context, TrendingMovies(), null, translator);
      }

      if (state is HasFavorite) {
        return _buildTabView(
            context, state.watching, state.finished, translator);
      }

      if (state is FavoriteError) {
        String message = ExceptionHandler.handle(context, state.exception);
        AppNavigator.instance.showAlertDialog(context, content: Text(message));
        return _buildScaffold(
            context,
            MessageView(
              message: message,
            ),
            null,
            translator);
      }
      return _buildScaffold(
          context, LoadingListPlaceHolder(), null, translator);
    });
  }

  Widget _buildAppBar(BuildContext context, AppLocalizations translator) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () => AppNavigator.instance.navToSetting(context),
      ),
      title: Center(
          child: Text(
        translator.translate('app_name'),
      )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () => AppNavigator.instance.navToSearch(context))
      ],
    );
  }

  Widget _buildScaffold(BuildContext context, Widget body,
      Widget bottomNavigationBar, AppLocalizations translator) {
    return Scaffold(
      appBar: _buildAppBar(context, translator),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget _buildTabView(BuildContext context, List<Movie> watchingList,
      List<Movie> finishedList, AppLocalizations translator) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: _buildScaffold(
            context,
            TabBarView(children: [
              MoviesPanel(watchingList),
              MoviesPanel(finishedList),
            ]),
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.remove_red_eye),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        translator.translate('title_watching'),
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
                      Text(translator.translate('title_finished'))
                    ],
                  ),
                ),
              ],
            ),
            translator));
  }
}
