import 'package:flutter/material.dart';

class LocaleItem extends StatelessWidget {
  final Locale locale;
  final Function onTap;

  LocaleItem({@required this.locale, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(locale.toString().substring(0, 2)),
        ),
        title: Text(locale.toString().substring(3)),
        onTap: onTap,
      ),
    );
  }
}
