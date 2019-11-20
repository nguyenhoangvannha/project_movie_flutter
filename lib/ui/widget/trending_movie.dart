import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/trending_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/guide.dart';
import 'package:project_movie_flutter/ui/widget/movie_list_ver_item.dart';
import 'package:project_movie_flutter/util/device_info.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import 'common/loading_list_placeholder.dart';
import 'common/message_view.dart';

class TrendingMovies extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TrendingMovieBloc>(context)
      ..dispatch(Fetch());
    AppLocalizations translator = AppLocalizations.of(context);

    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
      builder: (bbCtx, state) {
        if (state is Error) {
          String message = ExceptionHandler.handle(context, state.exception);
          AppNavigator.instance.showAlertDialog(context,
              title: Text('Error'), content: Text(message));
          return _buildError(context, bloc, state.exception, translator);
        }
        if (state is Loaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text(translator.translate('msg_no_movies')),
            );
          }
          return _buildResult(context, state.movies, translator);
        }
        return Center(
          child: LoadingListPlaceHolder(),
        );
      },
    );
  }

  double _calculateListItemHeight(bool isPortrait, double height) {
    var heightPercent = 0.0;
    if (isPortrait) {
      heightPercent = DeviceInfo.displayResolution() != DisplayResolution.HD
          ? 0.225
          : 0.235;
    } else {
      heightPercent = height > 700 ? 0.6 : 0.55;
    }
    return heightPercent * height;
  }

  Widget _buildResult(BuildContext context, List<Movie> movies,
      AppLocalizations translator) {
    Color bgColor = Theme
        .of(context)
        .canvasColor;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: bgColor,
          pinned: false,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Guide(),
          ),
        ),
        SliverList(
          delegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
            final movie = movies.elementAt(index);
            return Container(
                height: _calculateListItemHeight(
                    MediaQuery
                        .of(context)
                        .orientation == Orientation.portrait,
                    MediaQuery
                        .of(context)
                        .size
                        .height),
                margin: EdgeInsets.only(left: 8, right: 8),
                child: MovieListVerItem(
                  movie,
                  onTap: () =>
                      AppNavigator.instance
                          .showBottomSheetMovieDetails(context, movie),
                  onLongPress: () =>
                      AppNavigator.instance
                          .showBottomSheetEditMovie(context, movie),
                ));
          }, childCount: movies.length),
        )
      ],
    );

  }

  Widget _buildError(BuildContext context, TrendingMovieBloc bloc,
      Exception exception, AppLocalizations translator) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MessageView(
            message: '${ExceptionHandler.handle(context, exception)}',
          ),
          RaisedButton(
              onPressed: () {
                bloc.dispatch(Fetch());
              },
              child: Text(translator.translate('act_retry'))),
          RaisedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(translator.translate('act_exit'))),
        ],
      ),
    );
  }
}
