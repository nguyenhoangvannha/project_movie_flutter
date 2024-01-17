import 'package:flutter/material.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'common/cached_image.dart';
import 'common/container.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;
  final Function? onTap;
  final Function? onLongPress;

  MovieGridItem(this.movie, {this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context)
        .textTheme
        .caption!
        .copyWith(fontStyle: FontStyle.normal, fontSize: 10);
    return InkWell(
      onTap: onTap as void Function()?,
      onLongPress: onLongPress as void Function()?,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomCard(
              margin: EdgeInsets.all(4),
              child: CachedImage(image: movie.posterPath),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(
              movie.title!,
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 8,
              ),
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
                movie.releaseDate!,
                style: caption,
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
