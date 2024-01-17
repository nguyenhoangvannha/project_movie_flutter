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
  final Function? onTap;
  final Function? onLongPress;

  const SearchItem(this.movie, {Key? key, this.onTap, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavouriteMovieBloc>(context)
      ..add(CheckFavorite(movieId: movie.id));
    final translator = AppLocalizations.of(context);

    return BlocBuilder<FavouriteMovieBloc, FavouriteMovieState>(
        buildWhen: (pre, cur) {
      return cur is FavoriteChecked && cur.movieId == movie.id;
    }, builder: (bCtx, state) {
      if (state is FavoriteChecked) {
        bool favorite = state.isFavorite;
        return Slidable(
          key: Key(movie.id.toString()),
          closeOnScroll: true,
          child: _buildContent(context),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: <Widget>[
              SlidableAction(
                label: favorite
                    ? translator!.translate('act_remove')
                    : translator!.translate('act_favourite'),
                backgroundColor: favorite ? Colors.red : Colors.yellow,
                icon: favorite ? Icons.remove_circle : Icons.star,
                onPressed: (context) {
                  if (favorite) {
                    favBloc.add(RemoveFavorite(movieId: movie.id));
                  } else {
                    favBloc.add(AddFavorite(movie: movie));
                  }
                  AppNavigator.instance!.showSnackBar(
                      context,
                      favorite
                          ? translator.translate('act_remove_favourite')!
                          : translator.translate('act_add_favourite')!);
                },
              ),
              if (favorite)
                !movie.finished!
                    ? SlidableAction(
                        label: translator.translate('act_finished'),
                        backgroundColor: Colors.black,
                        icon: Icons.move_to_inbox,
                        onPressed: (context) {
                          movie.finished = true;
                          favBloc.add(UpdateFavorite(movie: movie));
                          AppNavigator.instance!.showSnackBar(context,
                              translator.translate('act_move_finished')!);
                        },
                      )
                    : SlidableAction(
                        label: translator.translate('act_watching'),
                        backgroundColor: Colors.green,
                        icon: Icons.watch_later,
                        onPressed: (context) {
                          movie.finished = false;
                          favBloc.add(UpdateFavorite(movie: movie));
                          AppNavigator.instance!.showSnackBar(context,
                              translator.translate('act_move_watching')!);
                        },
                      )
            ],
          ),
        );
      } else {
        return const LoadingIndicator();
      }
    });
  }

  _buildContent(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      onLongPress: onLongPress as void Function()?,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: CachedImage(
            image: movie.posterPath,
            fit: BoxFit.fill,
            //placeHolderHeight: 30,
          ),
        ),
        title: Text(
          movie.title!,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          movie.overview!,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Chip(
          label: SizedBox(
            width: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(movie.voteAverage.toString()),
                const SizedBox(
                  width: 1,
                ),
                const Icon(
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
