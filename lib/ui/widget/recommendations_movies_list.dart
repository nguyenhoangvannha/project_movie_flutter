import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/usecase/movie/get_recommendations_movies.dart';
import 'package:project_movie_flutter/ui/bloc/recommendation_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import 'common/loading_indicator.dart';
import 'common/message_view.dart';
import 'movie_list_hor.dart';

class RecommendationsMoviesList extends StatelessWidget {
  final int? _movieId;
  final RecommendationMovieBloc? recommendationMovieBloc;

  const RecommendationsMoviesList(this._movieId,
      {Key? key, this.recommendationMovieBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = recommendationMovieBloc ??
        RecommendationMovieBloc(
            getRecommendationMovie:
                RepositoryProvider.of<GetRecommendationsMovies>(context))
      ..add(Fetch(movieId: _movieId));
    return BlocBuilder<RecommendationMovieBloc, RecommendationMovieState>(
      bloc: bloc,
      builder: (bCtx, state) {
        if (state is Loading) {
          return const LoadingIndicator();
        }
        if (state is Error) {
          return Center(
            child: MessageView(
                message: ExceptionHandler.handle(context, state.exception)),
          );
        }
        if (state is Result) {
          if (state.movies!.isEmpty) {
            return MessageView(
              icon: Icons.info_outline,
              message: AppLocalizations.of(context)!.translate('msg_no_movies'),
            );
          }
          return MoviesListHor(
            movies: state.movies,
          );
        }
        return const Center(
          child: MessageView(),
        );
      },
    );
  }
}
