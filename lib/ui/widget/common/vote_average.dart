import 'package:flutter/material.dart';

import 'container.dart';

class VoteAverage extends StatelessWidget {
  final double voteAverage;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const VoteAverage(
      {Key? key, required this.voteAverage, this.margin, this.padding})
      : super(key: key);

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
          const Icon(
            Icons.star,
            size: 8,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
