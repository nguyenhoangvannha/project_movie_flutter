import 'package:flutter/material.dart';
import 'package:project_movie_flutter/global/config/navigator.dart';
import 'package:project_movie_flutter/global/localizations/app_localizations.dart';

import '../../widget/trending_movie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () => AppNavigator.instance.navToSetting(context),
      ),
      title: Center(
          child: Text(
        AppLocalizations.of(context).translate('app_name'),
      )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () => AppNavigator.instance.navToSearch(context))
      ],
    );
  }

  _buildContent(BuildContext context) {
    return TrendingMovies();
  }
}
