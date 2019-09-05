import 'package:flutter/material.dart';

import 'custom.dart' as Custom;

class CastItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  CastItem({@required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: GridTile(
        child: Container(
          margin: EdgeInsets.only(bottom: 38),
          child: Custom.RoundedBackground(
              child: Custom.NetworkImage(imageUrl: imageUrl)),
        ),
        footer: Container(
          margin: EdgeInsets.only(top: 38),
          padding: EdgeInsets.all(4),
          child: Text(
            title,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
