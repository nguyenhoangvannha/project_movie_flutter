import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/global/components/navigation.dart' as Navs;
import 'package:project_movie/ui/widget/common/custom.dart';
import 'package:project_movie/ui/widget/common/movie_overview.dart';
import 'package:swipedetector/swipedetector.dart';

import '../../../bloc/movie_detail/bloc.dart';
import '../../../data/respository/entity/movie.dart';
import '../../../ui/widget/common/error_view.dart';
import '../../../ui/widget/common/loading_indicator.dart';

class BottomSheetMovies extends StatelessWidget {
  final int movieId;
  final swipeConfig = SwipeConfiguration(
      verticalSwipeMinVelocity: 100.0,
      verticalSwipeMinDisplacement: 50.0,
      verticalSwipeMaxWidthThreshold: 100.0,
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 50.0,
      horizontalSwipeMinVelocity: 200.0);

  BottomSheetMovies({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieDetailBloc>(context).dispatch(Load(movieId: movieId));
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (bCtx, state) {
        if (state is Loading) {
          return LoadingIndicator();
        }
        if (state is Error) {
          return ErrorView(message: 'Error: ${state.message}',);
        }
        if (state is NotFound) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        }
        if (state is Result) {
          return _buildMovieDetail(context, state.movie);
        }
        return ErrorView();
      },
    );
  }

  _showDetailPage(BuildContext context, Movie movie) {
    Navs.showDetailsPage(context, movie);
  }

  _dispose(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildMovieDetail(BuildContext context, Movie movie) {
    return SwipeDetector(
      swipeConfiguration: swipeConfig,
      onSwipeUp: () => _showDetailPage(context, movie),
      onSwipeLeft: () => _showDetailPage(context, movie),
      onSwipeDown: () => _dispose(context),
      onSwipeRight: () => _dispose(context),
      child: Card(
        elevation: 0,
        borderOnForeground: true,
        child: RoundedBackground(
          padding: EdgeInsets.all(8),
          child: MovieOverview(
            movie: movie,
            onPressedButton: () => Navs.showDetailsPage(context, movie),
          ),
        ),
      ),
    );
  }
}
