import 'package:flutter/material.dart';
import 'package:project_movie_flutter/global/localizations/app_localizations.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            AppLocalizations.of(context).translate('msg_loading') + "...",
            style: Theme
                .of(context)
                .textTheme
                .subtitle,
          )
        ],
      ),
    );
  }
}
