import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

class SearchListItem extends StatelessWidget {
  final Movie movie;

  SearchListItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: movie.posterPath,
        ),
        title: Text(movie.title),
        subtitle: Text(
          movie.overview,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Chip(
            label: Container(
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${movie.voteAverage}'),
              Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
        )),
      ),
    );
  }
}
