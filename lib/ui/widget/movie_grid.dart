import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';
import 'package:project_movie/ui/widget/common/movie_item_small.dart';

import '../../global/navigation.dart' as Navs;

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
        return _buildItem(context, movie);
      },
    );
  }

  Widget _buildItem(BuildContext context, Movie movie) {
    return MovieItemSmall(
      title: movie.title,
      imageUrl: movie.posterPath,
      onTap: () => Navs.showBottomSheetMovieDetails(context, movie.id),
      //onLongPress: () => Navs.showBottomSheetEditMovie(context, movie),
    );
  }
}
