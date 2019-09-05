import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/ui/widget/common/custom_container.dart';
import 'package:swipedetector/swipedetector.dart';

import '../../../bloc/movie_detail/bloc.dart';
import '../../../data/respository/entity/movie.dart';
import '../../../global/navigation.dart' as Navs;
import '../../../ui/widget/common/error_view.dart';
import '../../../ui/widget/common/loading_indicator.dart';
import '../../../ui/widget/movie_overview.dart';

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
          return Center(
            child: Text('Error: ${state.message}'),
          );
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

  Widget _buildMovieDetail(BuildContext context, Movie movie) {
    return SwipeDetector(
      swipeConfiguration: swipeConfig,
      onSwipeUp: () => Navs.showDetailsPage(context, movie),
      onSwipeLeft: () => Navs.showDetailsPage(context, movie),
      onSwipeDown: () => Navigator.of(context).pop(),
      onSwipeRight: () => Navigator.of(context).pop(),
      child: Card(
        elevation: 0,
        borderOnForeground: true,
        child: RoundedRectangle(
          top: 16,
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
