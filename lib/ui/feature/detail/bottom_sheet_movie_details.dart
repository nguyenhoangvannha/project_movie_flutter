import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipedetector/swipedetector.dart';

import '../../../bloc/movie_detail/bloc.dart';
import '../../../data/respository/entity/movie.dart';
import '../../../global/navigation.dart' as Navs;
import '../../../ui/widget/common/custom_container.dart';
import '../../../ui/widget/common/custom_text.dart';
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
          print("${state.movie.toString()}");
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
      child: Scaffold(
        appBar: _buildAppBar(context, movie),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: RoundedRectangle.only(
          child: MovieOverview(
            title: movie.title,
            content: movie.overview,
            imageUrl: movie.posterPath,
            onPressedButton: () => Navs.showDetailsPage(context, movie),
          ),
          top: 18,
          padding: EdgeInsets.all(16),
          color: Theme
              .of(context)
              .accentColor,
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Movie movie) {
    return AppBar(
      bottom: PreferredSize(
          child: SizedBox(), preferredSize: Size(double.infinity, 18)),
      backgroundColor: Colors.grey,
      title: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: TextTitle(
          text: movie.title,
        ),
        subtitle: TextTitle(
          text: movie.releaseDate,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          onPressed: null,
        ),
//        Consumer<Movie>(
//          builder: (_, movie, child) {
//            return IconButton(
//              icon: Icon(
//                movie.isFavorite ? Icons.star : Icons.star_border,
//                color: Colors.yellow,
//              ),
//              onPressed: () {
//                final favorites =
//                    Provider.of<Favorites>(context, listen: false);
//                if (movie.isFavorite) {
//                  favorites.removeFavorite(movie.id);
//                } else {
//                  favorites.add(movie);
//                }
//              },
//            );
//          },
//        )
      ],
      elevation: 0,
    );
  }
}
