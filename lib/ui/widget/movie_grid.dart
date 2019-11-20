import 'package:flutter/material.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'movie_grid_item.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;
  final Function() onEndList;

  MovieGrid({@required this.movies, this.onEndList});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
        mediaQueryData.orientation == Orientation.portrait ? 3 : 5,
        childAspectRatio: 1.7 / 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6);
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            onEndList != null) {
          onEndList();
        }
        return true;
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        gridDelegate: gridDelegate,
        itemBuilder: (_, index) {
          final movie = movies.elementAt(index);
          return Container(
            child: MovieGridItem(
              movie,
              onTap: () =>
                  AppNavigator.instance
                      .showBottomSheetMovieDetails(context, movie),
              onLongPress: () =>
                  AppNavigator.instance
                      .showBottomSheetEditMovie(context, movie),
            ),
          );
        },
      ),
    );
  }
}
