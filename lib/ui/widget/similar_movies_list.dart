import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/usecase/movie/get_similar_movies.dart';
import 'package:project_movie_flutter/ui/bloc/similar_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import 'common/loading_indicator.dart';
import 'common/message_view.dart';
import 'movie_list_hor.dart';

class SimilarMoviesList extends StatelessWidget {
  final int _movieId;
  final SimilarMovieBloc similarMovieBloc;

  SimilarMoviesList(this._movieId, {this.similarMovieBloc});

  @override
  Widget build(BuildContext context) {
    final bloc = this.similarMovieBloc ??
        SimilarMovieBloc(
            getSimilarMovies: RepositoryProvider.of<GetSimilarMovies>(context))
          ..dispatch(Fetch(movieId: _movieId));
    return BlocBuilder<SimilarMovieBloc, SimilarMovieState>(
      bloc: bloc,
      builder: (bCtx, state) {
        if (state is Loading) {
          print("LOADING SIMILAR");
          return LoadingIndicator();
        }
        if (state is Error) {
          return Center(
            child: MessageView(
                message: ExceptionHandler.handle(context, state.exception)),
          );
        }
        if (state is Result) {
          if (state.movies.isEmpty) {
            return MessageView(
              icon: Icons.info_outline,
              message: AppLocalizations.of(context).translate(
                  'msg_no_movies'),);
          }
          return MoviesListHor(
            movies: state.movies,
          );
        }
        return Center(
          child: MessageView(),
        );
      },
    );
  }
}
