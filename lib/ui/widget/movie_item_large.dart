import 'package:flutter/material.dart';

import '../../data/respository/entity/movie.dart';
import '../../ui/widget/common/custom_container.dart';
import '../../ui/widget/common/custom_text.dart';

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
          child: RoundedCachedNetworkImage(
            imageUrl: movie.posterPath,
          ),
          header: RoundedBlurContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextTitleWhite(
                text: movie.title,
                maxLines: 2,
              ),
              TextTitleWhite(
                text: movie.releaseDate,
                fontSize: 14,
              )
            ],
          )),
          footer: GridTileBar(
            leading: RoundedBlurContainer(
              child: TextTitleWhite(
                text: movie.originalLanguage,
                color: Colors.yellow,
                fontSize: 16,
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
