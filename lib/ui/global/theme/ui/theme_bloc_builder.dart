import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class ThemeBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData? themeData) builder;

  const ThemeBlocBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc.instance!,
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (ctx, themeState) {
        return builder(context, themeState.themeData);
      }),
    );
  }
}
