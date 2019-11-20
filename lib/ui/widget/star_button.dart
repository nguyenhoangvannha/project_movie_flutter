import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';

class StarButton extends StatelessWidget {
  final Movie movie;

  StarButton({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context);
    favBloc.dispatch(CheckFavorite(movieId: movie.id));
    return BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
        condition: (pre, cur) {
          return cur is FavoriteChecked && cur.movieId == movie.id;
        }, builder: (bCtx, state) {
      if (state is FavoriteChecked)
        return IconButton(
          icon: Icon(
            state.isFavorite
                ? Icons.star
                : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            if (state.isFavorite) {
              favBloc.dispatch(RemoveFavorite(movieId: movie.id));
            } else {
              favBloc.dispatch(AddFavorite(movie: movie));
            }
          },
        );
      else
        return Text('');
    });
  }
}
