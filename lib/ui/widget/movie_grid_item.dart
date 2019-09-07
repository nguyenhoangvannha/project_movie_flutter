import 'package:flutter/material.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/ui/widget/common/vote_average.dart';

import './common/custom.dart' as Custom;

class MovieGridItem extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  MovieGridItem({@required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          elevation: 4,
          child: GridTile(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                VoteAverage(
                  voteAverage: movie.voteAverage,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                )
              ],
            ),
            child: Custom.RoundedRectangle(
                child: Custom.CustomNetworkImage(
              boxFit: BoxFit.cover,
              imageUrl: movie.posterPath,
            )),
            footer: Custom.RoundedBackground(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Text(
                '${movie.title}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )),
    );
  }
}
