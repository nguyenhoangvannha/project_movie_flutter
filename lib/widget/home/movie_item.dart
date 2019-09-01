import 'package:flutter/material.dart';
import 'package:project_movie/data/model/Movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${movie.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(movie.title),
      isThreeLine: true,
      subtitle: Text(movie.overview),
      dense: true,
    );
  }
}
