import 'package:flutter/material.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';

class MessageView extends StatelessWidget {
  final IconData icon;
  final String message;

  MessageView({this.icon, this.message = 'Unknown state'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon ?? Icons.warning),
            SizedBox(
              width: 8,
            ),
            TextTitle(message),
          ],
        ),
      ),
    );
  }
}
