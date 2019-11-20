import 'package:flutter/material.dart';

import 'common/cached_image.dart';

class CastListItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  CastListItem({@required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Card(
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: CachedImage(
              image: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          '$title\n',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
