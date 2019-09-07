import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/global/components/helper.dart';

import './ui/feature/home/home_page.dart';
import 'global/components/routes.dart';
import 'global/language/bloc/bloc.dart';
import 'global/language/localizations_delegates.dart';
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
      child: BlocBuilder<LocalizationsBloc, LocalizationsState>(
          builder: (bCtx, localeState) {
            return BlocBuilder<ThemeBloc, ThemeState>(builder: (ctx, state) {
          return MaterialApp(
            title: 'Project Movie',
            theme: state.themeData,
            locale: localeState.locale,
            supportedLocales: LocalizationsDelegates.instance.supportedLocales,
            localizationsDelegates:
            LocalizationsDelegates.instance.localizationsDelegates,
            localeResolutionCallback:
            LocalizationsDelegates.instance.localeResolutionCallback,
            routes: Routes.routes,
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (ctx) => HomePage());
            },
          );
            });
          }),
    );
  }
}
