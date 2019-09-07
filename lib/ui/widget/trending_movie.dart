import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/bloc/trending_movie/bloc.dart';
import 'package:project_movie_flutter/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/movie_grid.dart';

import 'common/error_view.dart';
import 'common/loading_indicator.dart';

class TrendingMovies extends StatelessWidget {
  Widget build(BuildContext context) {
    BlocProvider.of<TrendingMovieBloc>(context).dispatch(Fetch());
    AppLocalizations translator = AppLocalizations.of(context);
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
      builder: (context, state) {
        if (state is MovieError) {
          return Center(
            child: ErrorView(message: state.message),
          );
        }
        if (state is MovieLoaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text(translator.translate('msg_no_movies')),
            );
          }
          return Column(
            children: <Widget>[
              ListTile(
                leading: Text(
                  translator.translate('title_trending'),
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                ),
              ),
              Expanded(
                  child: MovieGrid(
                    movies: state.movies,
                  ))
            ],
          );
        }
        return Center(
          child: LoadingIndicator(),
        );
      },
    );
  }
}
