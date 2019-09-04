import 'package:flutter/material.dart';
import 'package:project_movie/ui/widget/base/custom_container.dart';
import 'package:project_movie/ui/widget/base/custom_text.dart';

class MovieItemSmall extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function onTap;
  final Function onLongPress;

  MovieItemSmall(
      {@required this.title,
      @required this.imageUrl,
      this.onTap,
      this.onLongPress});

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
            imageUrl: imageUrl,
          ),
          footer: RoundedBlurContainer(
            child: TextTitleWhite(
              text: title,
              fontSize: 12,
              maxLines: 2,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
