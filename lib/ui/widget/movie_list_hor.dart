import 'package:flutter/material.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'movie_list_hor_item.dart';

class MoviesListHor extends StatelessWidget {
  final List<Movie> movies;

  const MoviesListHor({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bool isPortrait = mediaQueryData.orientation == Orientation.portrait;
    final height = mediaQueryData.size.height;
    final width = mediaQueryData.size.width;
    final itemWidth = _calculateListItemWidth(isPortrait, width);
    return Container(
      width: width,
      height: _calculateListViewHeight(isPortrait, height),
      child: _buildList(itemWidth),
    );
  }

  Widget _buildList(double itemWidth) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies.elementAt(index);
          return Container(
              width: itemWidth,
              margin: EdgeInsets.only(left: 4, right: 4),
              child: MovieListHorItem(
                movie,
                onTap: () => AppNavigator.instance
                    .showBottomSheetMovieDetails(context, movie),
                onLongPress: () => AppNavigator.instance
                    .showBottomSheetEditMovie(context, movie),
              ));
        });
  }

  double _calculateListViewHeight(bool isPortrait, double height) {
    var heightPercent = 0.0;
    if (isPortrait) {
      heightPercent = height > 700 ? 0.27 : 0.3;
    } else {
      heightPercent = height > 700 ? 0.6 : 0.55;
    }
    return heightPercent * height;
  }

  double _calculateListItemWidth(bool isPortrait, double width) {
    return isPortrait ? width * 0.3 : width * 0.2;
  }
}
