import 'package:flutter/material.dart';
import 'package:project_movie_flutter/global/config/navigator.dart';
import 'package:project_movie_flutter/global/localizations/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('title_settings')),
      ),
      body: _buildBody(context, translator),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations translator) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.format_paint),
            title: Text(translator.translate('title_themes')),
            onTap: () => AppNavigator.instance.navToThemeSetting(context),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text(translator.translate('title_languages')),
            onTap: () => AppNavigator.instance.navToLanguagesSetting(context),
          ),
        ),
      ],
    );
  }
}
