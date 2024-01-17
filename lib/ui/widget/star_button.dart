import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';

class StarButton extends StatelessWidget {
  final Movie movie;

  StarButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context);
    favBloc.add(CheckFavorite(movieId: movie.id));
    return BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
        buildWhen: (pre, cur) {
      return cur is FavoriteChecked && cur.movieId == movie.id;
    }, builder: (bCtx, state) {
      if (state is FavoriteChecked)
        return IconButton(
          icon: Icon(
            state.isFavorite ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            if (state.isFavorite) {
              favBloc.add(RemoveFavorite(movieId: movie.id));
            } else {
              favBloc.add(AddFavorite(movie: movie));
            }
          },
        );
      else
        return Text('');
    });
  }
}
