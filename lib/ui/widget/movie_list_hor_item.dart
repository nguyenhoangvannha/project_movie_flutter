import 'package:flutter/material.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'common/cached_image.dart';
import 'common/container.dart';

class MovieListHorItem extends StatelessWidget {
  final Movie movie;
  final Function? onTap;
  final Function? onLongPress;

  const MovieListHorItem(this.movie, {Key? key, this.onTap, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontStyle: FontStyle.normal, fontSize: 10);
    return InkWell(
      onTap: onTap as void Function()?,
      onLongPress: onLongPress as void Function()?,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomCard(
              margin: const EdgeInsets.all(4),
              child: CachedImage(image: movie.posterPath),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${movie.title}\n',
            style: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Text(movie.voteAverage.toString(), style: caption),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.star,
                size: 8,
              ),
              const Spacer(),
              Text(
                movie.releaseDate!
                    .substring(0, movie.releaseDate!.indexOf('-')),
                style: caption,
              ),
              const SizedBox(
                width: 8,
              )
            ],
          )
        ],
      ),
    );
  }
}
