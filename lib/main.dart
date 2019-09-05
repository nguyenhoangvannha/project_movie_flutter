import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './ui/feature/home/home_page.dart';
import 'global/helper.dart';
import 'global/theme/bloc/bloc.dart';

void main() {
  Helper.getInstance().initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: Helper
            .getInstance()
            .providers,
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (ctx, state) {
          return MaterialApp(
            title: 'Project Movie',
            theme: state.themeData,
            home: HomePage(),
          );
        }));
  }
}
