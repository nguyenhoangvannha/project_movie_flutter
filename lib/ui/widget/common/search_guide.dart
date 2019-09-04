import 'package:flutter/material.dart';

import '../../../ui/widget/common/custom_text.dart';

class SearchGuide extends StatelessWidget {
  final String title;
  final String subtitle;

  SearchGuide({this.title = 'Search guide', this.subtitle = 'Type to search'});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              size: 60,
            ),
            TextTitle(
              text: title,
            ),
            SizedBox(
              height: 4,
            ),
            TextSubtitle(
              text: subtitle,
            )
          ],
        ),
      ),
    );
  }
}
