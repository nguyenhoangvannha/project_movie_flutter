import 'package:flutter/material.dart';

import '../app_localizations.dart';

class LocaleItem extends StatelessWidget {
  final Locale locale;
  final Function onTap;

  LocaleItem({@required this.locale, this.onTap});

  @override
  Widget build(BuildContext context) {
    final languageString =
        AppLocalizations.of(context).translate(locale.toString());
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(locale.languageCode),
        ),
        title: Text(languageString),
        onTap: onTap,
      ),
    );
  }
}
