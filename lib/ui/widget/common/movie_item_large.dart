import 'package:flutter/material.dart';

import '../../../data/respository/entity/movie.dart';
import '../../../ui/widget/common/custom_container.dart';
import '../../../ui/widget/common/custom_text.dart';

class MovieItemLarge extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final Function onLongPress;

  MovieItemLarge({@required this.movie, this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        elevation: 8,
        color: Colors.transparent,
        child: GridTile(
          child: RoundedImage(
            imageUrl: movie.posterPath,
          ),
          header: RoundedBlurContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextTitle(
                text: movie.title,
                maxLines: 2,
              ),
              TextTitle(
                text: movie.releaseDate,
              )
            ],
          )),
          footer: GridTileBar(
            leading: RoundedBlurContainer(
              child: TextTitle(
                text: movie.originalLanguage,
              ),
              color: Colors.white24,
            ),
            title: SizedBox(
              width: double.infinity,
            ),
            trailing: VoteAverage(movie.voteAverage),
            //trailing: VoteAverage(voteAverage),
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(18),
    );
  }
}
