import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';

import 'common/cached_image.dart';
import 'common/container.dart';
import 'common/loading_indicator.dart';
import 'common/text.dart';

class MovieListVerItem extends StatelessWidget {
  final Movie movie;
  final Function? onTap;
  final Function? onLongPress;

  const MovieListVerItem(this.movie, {Key? key, this.onTap, this.onLongPress})
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
          closeOnScroll: true,
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
          child: _buildContent(context),
        );
      } else {
        return const LoadingIndicator();
      }
    });
  }

  Widget _buildContent(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      onLongPress: onLongPress as void Function()?,
      child: LayoutBuilder(builder: (_, constrains) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.275,
                child: CustomCard(
                  margin: const EdgeInsets.only(right: 16, bottom: 8),
                  child: CachedImage(image: movie.posterPath),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 2,
                  ),
                  TextTitle(
                    movie.title,
                    maxLines: 2,
                    fontSize: 18,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.date_range,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      TextCaption(movie.releaseDate),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.language,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      TextCaption(movie.originalLanguage)
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Expanded(
                      //height: constrains.maxHeight * 0.25,
                      child: Text(
                    movie.overview!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                    softWrap: true,
                    maxLines: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 4
                        : 6,
                  )),
                  Row(
                    children: <Widget>[
                      Chip(
                          label: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextSubtitle(movie.voteAverage.toString())
                        ],
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Chip(
                          label: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.sort,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextSubtitle(movie.voteCount.toString())
                        ],
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Chip(
                          label: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.format_list_numbered,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextSubtitle(movie.popularity.toString())
                        ],
                      )),
                    ],
                  )
                ],
              ))
            ],
          ),
        );
      }),
    );
  }
}
