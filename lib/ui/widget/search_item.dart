import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/loading_indicator.dart';

import 'common/cached_image.dart';

class SearchItem extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final Function onLongPress;
  final SlidableController slidableController;

  SearchItem(this.movie,
      {@required this.slidableController, this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context)
      ..dispatch(CheckFavorite(movieId: movie.id));
    final translator = AppLocalizations.of(context);

    return BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
        condition: (pre, cur) {
          return cur is FavoriteChecked && cur.movieId == movie.id;
        }, builder: (bCtx, state) {
      if (state is FavoriteChecked) {
        bool favorite = state.isFavorite;
        return Slidable(
          key: Key(movie.id.toString()),
          controller: slidableController,
          closeOnScroll: true,
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: _buildContent(context),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: favorite
                  ? translator.translate('act_remove')
                  : translator.translate('act_favourite'),
              color: favorite ? Colors.red : Colors.yellow,
              icon: favorite ? Icons.remove_circle : Icons.star,
              onTap: () {
                if (favorite) {
                  favBloc.dispatch(RemoveFavorite(movieId: movie.id));
                } else {
                  favBloc.dispatch(AddFavorite(movie: movie));
                }
                AppNavigator.instance.showSnackBar(
                    context,
                    favorite
                        ? translator.translate('act_remove_favourite')
                        : translator.translate('act_add_favourite'));
              },
            ),
            if (favorite)
              !movie.finished
                  ? IconSlideAction(
                caption: translator.translate('act_finished'),
                color: Colors.black,
                icon: Icons.move_to_inbox,
                onTap: () {
                  movie.finished = true;
                  favBloc.dispatch(UpdateFavorite(movie: movie));
                  AppNavigator.instance.showSnackBar(
                      context, translator.translate('act_move_finished'));
                },
              )
                  : IconSlideAction(
                caption: translator.translate('act_watching'),
                color: Colors.green,
                icon: Icons.watch_later,
                onTap: () {
                  movie.finished = false;
                  favBloc.dispatch(UpdateFavorite(movie: movie));
                  AppNavigator.instance.showSnackBar(
                      context, translator.translate('act_move_watching'));
                },
              )
          ],
        );
      } else
        return LoadingIndicator();
    });
  }

  _buildContent(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 8, right: 8),
        leading: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.1,
          child: CachedImage(
            image: movie.posterPath,
            fit: BoxFit.fill,
            //placeHolderHeight: 30,
          ),
        ),
        title: Text(
          movie.title,
          style: Theme
              .of(context)
              .textTheme
              .title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          movie.overview,
          style: Theme
              .of(context)
              .textTheme
              .caption,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Chip(
          label: Container(
            width: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(movie.voteAverage.toString()),
                SizedBox(
                  width: 1,
                ),
                Icon(
                  Icons.star,
                  size: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
