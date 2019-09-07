import 'package:flutter/material.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/global/config/navigator.dart';
import 'package:project_movie_flutter/ui/widget/movie_grid_item.dart';

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
          onTap: () => AppNavigator.instance.showBottomSheetMovieDetails(context, movie),
        );
      },
    );
  }
}
