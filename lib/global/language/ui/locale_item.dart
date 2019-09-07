import 'package:flutter/material.dart';

class LocaleItem extends StatelessWidget {
  final Locale locale;
  final Function onTap;

  LocaleItem({@required this.locale, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(locale.toString()),
      onTap: onTap,
    );
  }
}
