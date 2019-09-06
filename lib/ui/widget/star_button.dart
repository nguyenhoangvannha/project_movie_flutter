import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/favorite/bloc.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

class StarButton extends StatelessWidget {
  final Movie movie;

  StarButton({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavoriteBloc>(context);
    favBloc.dispatch(CheckFavorite(movieId: movie.id));
    return BlocBuilder<FavoriteBloc, FavoriteState>(condition: (pre, cur) {
      return cur is FavoriteChecked;
    }, builder: (bCtx, state2) {
      var state = state2 as FavoriteChecked;
      return IconButton(
        icon: Icon(
          state.isFavorite && state.movieId == movie.id
              ? Icons.star
              : Icons.star_border,
          color: Colors.yellow,
        ),
        onPressed: () {
          if (state.movieId == movie.id) {
            if (state.isFavorite) {
              favBloc.dispatch(RemoveFavorite(movieId: movie.id));
            } else {
              favBloc.dispatch(AddFavorite(movie: movie));
            }
          }
        },
      );
    });
  }
}
