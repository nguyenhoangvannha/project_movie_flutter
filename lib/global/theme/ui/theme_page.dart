import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';
import '../bloc/bloc.dart';
import 'theme_item.dart';

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
            return ThemeItem(
              theme: theme,
              themeData: appThemeData[theme],
              onTap: () =>
                  BlocProvider.of<ThemeBloc>(context)
                      .dispatch(ThemeChanged(theme: theme)),
            );
          }),
    );
  }
}
