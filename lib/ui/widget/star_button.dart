import 'package:flutter/material.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';

class StarButton extends StatelessWidget {
  final Movie movie;

  StarButton({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.star), onPressed: null);
  }
}
