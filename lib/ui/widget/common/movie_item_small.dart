import 'package:flutter/material.dart';

import '../../../ui/widget/common/custom_container.dart';
import '../../../ui/widget/common/custom_text.dart';

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
          child: RoundedImage(
            imageUrl: imageUrl,
          ),
          footer: RoundedBlurContainer(
            child: TextSubtitle(
              text: title,
              maxLines: 2,
            ),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
