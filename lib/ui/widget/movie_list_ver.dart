import 'package:flutter/material.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/util/device_info.dart';

import 'movie_list_ver_item.dart';

class MoviesListVer extends StatelessWidget {
  final List<Movie> movies;
  final Function() onEndList;

  MoviesListVer({@required this.movies, this.onEndList});

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return LayoutBuilder(builder: (ctx, constraints) {
      double width = constraints.maxWidth;
      double height = MediaQuery.of(context).size.height;
      return _buildList(isPortrait, width, height);
    });
  }

  Widget _buildList(bool isPortrait, double width, double height) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            onEndList != null) {
          onEndList();
        }
        return true;
      },
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies.elementAt(index);

            return Container(
                height: _calculateListItemHeight(isPortrait, height),
                margin: EdgeInsets.only(left: 8, right: 8),
                child: MovieListVerItem(
                  movie,
                  onTap: () => AppNavigator.instance
                      .showBottomSheetMovieDetails(context, movie),
                  onLongPress: () => AppNavigator.instance
                      .showBottomSheetEditMovie(context, movie),
                ));
          }),
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
}
