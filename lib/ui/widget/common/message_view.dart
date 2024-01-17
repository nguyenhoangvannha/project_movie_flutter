import 'package:flutter/material.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';

class MessageView extends StatelessWidget {
  final IconData? icon;
  final String? message;

  const MessageView({Key? key, this.icon, this.message = 'Unknown state'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon ?? Icons.warning),
            const SizedBox(
              width: 8,
            ),
            TextTitle(message),
          ],
        ),
      ),
    );
  }
}
