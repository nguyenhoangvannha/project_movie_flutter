import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class ThemeBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  ThemeBlocBuilder({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (BuildContext context) => ThemeBloc.instance,
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (ctx, themeState) {
        return builder(context, themeState.themeData);
      }),
    );
  }
}
