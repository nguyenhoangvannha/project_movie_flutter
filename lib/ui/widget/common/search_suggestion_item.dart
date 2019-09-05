import 'package:flutter/material.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class SearchSuggestionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double voteAverage;
  final Function onTap;
  final Function onLongPress;

  SearchSuggestionItem(
      {@required this.title,
      @required this.subtitle,
      @required this.imageUrl,
      @required this.voteAverage,
      this.onTap,
      this.onLongPress});

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
                imageUrl: imageUrl,
              ),
              title: TextTitle(
                text: title,
              ),
              subtitle: TextSubtitle(
                text: subtitle,
              ),
              trailing: VoteAverage(voteAverage),
            ),
          ),
        ));
  }
}
