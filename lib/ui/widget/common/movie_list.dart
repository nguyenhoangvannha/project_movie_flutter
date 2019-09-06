import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

import '../../../global/navigation.dart' as Navs;
import 'movie_grid_item.dart';

class MoviesListWithTitleHorizontal extends StatelessWidget {
  final List<Movie> movies;

  const MoviesListWithTitleHorizontal({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final bool isPortrail =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return LayoutBuilder(builder: (ctx, constraints) {
      double width = constraints.maxWidth;
      double height = MediaQuery.of(context).size.height;
      return Container(
        width: width,
        height: isPortrail ? height * 0.2 : height * 0.4,
        child: _buildList(isPortrail, width, height),
      );
    });
  }

  Widget _buildList(bool isPortrail, double width, double height) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies.elementAt(index);
          return Container(
              width: isPortrail ? width * 0.25 : width * 0.2,
              margin: EdgeInsets.only(left: 8, top: 8),
              child: MovieGridItem(
                movie: movie,
                onTap: () =>
                    Navs.showBottomSheetMovieDetails(context, movie.id),
              ));
        });
    ;
  }
}
