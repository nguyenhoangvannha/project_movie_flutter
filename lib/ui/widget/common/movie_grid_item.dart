import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

import 'custom.dart' as Custom;

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
            header: Chip(
              label: Text(
                '${movie.originalLanguage}',
                textAlign: TextAlign.start,
              ),
            ),
            child: Custom.RoundedRectangle(
                child: Custom.NetworkImage(
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