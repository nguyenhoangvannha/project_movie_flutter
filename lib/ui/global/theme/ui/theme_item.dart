import 'package:flutter/material.dart';

import '../app_themes.dart';

class ThemeItem extends StatelessWidget {
  final Function? onTap;
  final ThemeData? themeData;
  final AppTheme theme;

  const ThemeItem(
      {Key? key, this.onTap, required this.themeData, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final appTheme = appThemeData[theme];
    return Card(
      color: themeData!.colorScheme.background,
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: themeData!.colorScheme.secondary,
          child: Text(
            theme
                .toString()
                .substring(theme.toString().lastIndexOf('.') + 1)[0],
            style: themeData!.textTheme.titleMedium,
          ),
        ),
        title: Text(
          theme.toString(),
          style: themeData!.textTheme.titleMedium,
        ),
        onTap: onTap as void Function()?,
      ),
    );
  }
}
