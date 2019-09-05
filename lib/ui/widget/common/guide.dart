import 'package:flutter/material.dart';

import '../../../ui/widget/common/custom_text.dart';

class Guide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  Guide({this.icon = Icons
      .search, this.title = 'Search guide', this.subtitle = 'Type to search'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
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
