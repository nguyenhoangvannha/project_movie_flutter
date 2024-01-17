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

  MovieListVerItem(this.movie, {this.onTap, this.onLongPress});

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
      } else
        return LoadingIndicator();
    });
  }

  Widget _buildContent(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      onLongPress: onLongPress as void Function()?,
      child: LayoutBuilder(builder: (_, constrains) {
        return Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.275,
                child: CustomCard(
                  margin: EdgeInsets.only(right: 16, bottom: 8),
                  child: CachedImage(image: movie.posterPath),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2,
                  ),
                  TextTitle(
                    movie.title,
                    maxLines: 2,
                    fontSize: 18,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 10,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      TextCaption(movie.releaseDate),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.language,
                        size: 10,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      TextCaption(movie.originalLanguage)
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Expanded(
                      //height: constrains.maxHeight * 0.25,
                      child: Text(
                    movie.overview!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
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
                          Icon(
                            Icons.star,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          TextSubtitle(movie.voteAverage.toString())
                        ],
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Chip(
                          label: Row(
                        children: <Widget>[
                          Icon(
                            Icons.sort,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          TextSubtitle(movie.voteCount.toString())
                        ],
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Chip(
                          label: Row(
                        children: <Widget>[
                          Icon(
                            Icons.format_list_numbered,
                            size: 12,
                          ),
                          SizedBox(
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
