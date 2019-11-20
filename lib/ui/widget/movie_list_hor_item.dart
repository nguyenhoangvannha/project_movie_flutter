import 'package:flutter/material.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'common/cached_image.dart';
import 'common/container.dart';

class MovieListHorItem extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final Function onLongPress;

  MovieListHorItem(this.movie, {this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context)
        .textTheme
        .caption
        .copyWith(fontStyle: FontStyle.normal, fontSize: 10);
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomCard(
              margin: EdgeInsets.all(4),
              child: CachedImage(
                  image: movie.posterPath),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '${movie.title}\n',
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 12),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Text(movie.voteAverage.toString(), style: caption),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.star,
                size: 8,
              ),
              Spacer(),
              Text(
                movie.releaseDate.substring(0, movie.releaseDate.indexOf('-')),
                style: caption,
              ),
              SizedBox(
                width: 8,
              )
            ],
          )
        ],
      ),
    );
  }
}
