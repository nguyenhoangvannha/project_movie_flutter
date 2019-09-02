import 'package:flutter/material.dart';
import 'package:project_movie/data/model/movie.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class SearchSuggestionItem extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final Function onLongPress;

  SearchSuggestionItem({@required this.movie, this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Card(
          elevation: 8,
          child: Center(
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 4),
              leading: RectangleCachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w342$movie.posterPath',
              ),
              title: TextTitle(
                text: movie.title,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              subtitle: TextSubtitle(
                text: movie.overview,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              trailing: VoteAverage(movie.voteAverage),
            ),
          ),
        ));
  }
}
