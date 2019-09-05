import 'package:flutter/material.dart';

import 'custom_text.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  MenuItem({@required this.icon, @required this.color, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: TextTitle(
        text: text,
      ),
    );
  }
}
