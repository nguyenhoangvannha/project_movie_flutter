import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';
import 'package:project_movie/global/components/navigation.dart' as Navs;

import '../common/movie_grid_item.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  MovieGrid({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 8);
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: movies.length,
      gridDelegate: gridDelegate,
      itemBuilder: (_, index) {
        final movie = movies.elementAt(index);
        return MovieGridItem(
          movie: movie,
          onTap: () => Navs.showBottomSheetMovieDetails(context, movie.id),
        );
      },
    );
  }
}
