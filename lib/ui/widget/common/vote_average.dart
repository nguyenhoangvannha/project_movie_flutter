import 'package:flutter/material.dart';

import 'custom.dart';

class VoteAverage extends StatelessWidget {
  final double voteAverage;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  VoteAverage({@required this.voteAverage, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return RoundedBackground(
      width: 55,
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$voteAverage',
            textAlign: TextAlign.start,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
