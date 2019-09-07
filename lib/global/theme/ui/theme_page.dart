import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';
import '../bloc/bloc.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Theme'),
      ),
      body: ListView.builder(
          itemCount: AppTheme.values.length,
          itemBuilder: (ctx, index) {
            final theme = AppTheme.values.elementAt(index);
            return _buildItem(context, theme);
          }),
    );
  }

  Widget _buildItem(BuildContext context, AppTheme theme) {
    final appTheme = appThemeData[theme];
    return Card(
      color: appTheme.backgroundColor,
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: appTheme.accentColor,
          child: Text(
            theme.toString().substring(
                theme.toString().lastIndexOf('.') + 1)[0],
            style: appTheme.textTheme.title,
          ),
        ),
        title: Text(theme.toString(), style: appTheme.textTheme.title,),
        onTap: () {
          BlocProvider.of<ThemeBloc>(context)
              .dispatch(ThemeChanged(theme: theme));
        },
      ),
    );
  }
}
