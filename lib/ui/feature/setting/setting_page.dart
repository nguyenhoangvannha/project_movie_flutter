import 'package:flutter/material.dart';

import '../../../global/navigation.dart' as Navs;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.format_paint),
            title: Text('Themes'),
            onTap: () {
              Navs.showThemeSetting(context);
            },
          ),
        ),
      ],
    );
  }
}
