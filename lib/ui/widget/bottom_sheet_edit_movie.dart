import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:swipedetector_nullsafety/swipedetector_nullsafety.dart';

import 'common/text.dart';

class BottomSheetEditMovie extends StatelessWidget {
  final Movie _movie;

  BottomSheetEditMovie(this._movie);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    BlocProvider.of<FavouriteMovieBloc>(context)
        .add(CheckFavorite(movieId: _movie.id));
    return SwipeDetector(
      swipeConfiguration: swipeConfig,
      onSwipeLeft: () => _hideBottomSheet(context),
      onSwipeDown: () => _hideBottomSheet(context),
      onSwipeRight: () => _hideBottomSheet(context),
      child: Column(
        children: <Widget>[
          ListTile(leading: TextTitle('Edit')),
          Divider(),
          BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
              buildWhen: (pre, cur) {
            return cur is FavoriteChecked;
          }, builder: (bCtx, state) {
            if (state is FavoriteChecked) {
              if (state.isFavorite) {
                return Column(
                  children: <Widget>[
                    _buildActionMove(context, translator),
                    Divider(),
                    _buildFavoriteAction(context, state.isFavorite, translator),
                  ],
                );
              }
              return _buildFavoriteAction(
                  context, state.isFavorite, translator);
            } else
              return SizedBox();
          })
        ],
      ),
    );
  }

  void _hideBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }

  final swipeConfig = SwipeConfiguration(
      verticalSwipeMinVelocity: 100.0,
      verticalSwipeMinDisplacement: 50.0,
      verticalSwipeMaxWidthThreshold: 100.0,
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement: 50.0,
      horizontalSwipeMinVelocity: 200.0);

  Widget _buildActionMove(BuildContext context, AppLocalizations translator) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context);
    return !_movie.finished
        ? InkWell(
            onTap: () {
              _movie.finished = true;
              favBloc.add(UpdateFavorite(movie: _movie));
              _hideBottomSheet(context);
            },
            child: ListTile(
              leading: Icon(Icons.move_to_inbox, color: Colors.black),
              title: Text(translator.translate('act_move_finished')),
            ),
          )
        : InkWell(
            onTap: () {
              _movie.finished = false;
              favBloc.add(UpdateFavorite(movie: _movie));
              _hideBottomSheet(context);
            },
            child: ListTile(
              leading: Icon(
                Icons.watch_later,
                color: Colors.green,
              ),
              title: Text(translator.translate('act_move_watching')),
            ),
          );
  }

  Widget _buildFavoriteAction(
      BuildContext context, bool favorite, AppLocalizations translator) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context);
    return InkWell(
      onTap: () {
        if (favorite) {
          favBloc.add(RemoveFavorite(movieId: _movie.id));
        } else {
          favBloc.add(AddFavorite(movie: _movie));
        }
        _hideBottomSheet(context);
      },
      child: ListTile(
        leading: Icon(
          favorite ? Icons.remove_circle : Icons.star,
          color: favorite ? Colors.red : Colors.yellow,
        ),
        title: Text(favorite
            ? translator.translate('act_remove_favourite')
            : translator.translate('act_add_favourite')),
      ),
    );
  }
}
