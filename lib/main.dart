import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import './ui/feature/home/home_page.dart';
import 'global/config/app_init.dart';
import 'global/config/routes.dart';
import 'global/config/simple_bloc_delegate.dart';
import 'global/localizations/ui/locale_bloc_builder.dart';
import 'global/theme/ui/theme_bloc_builder.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupLogging();
  runApp(MyApp());
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name} : ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBlocBuilder(
      builder: (BuildContext context,
          Locale locale,
          List<Locale> supportedLocales,
          List<LocalizationsDelegate> localizationsDelegates,
          Function localeResolutionCallback) {
        return ThemeBlocBuilder(
          builder: (BuildContext context, ThemeData themeData) {
            return MultiBlocProvider(
              providers: AppInit.instance.providers,
              child: MaterialApp(
                title: 'app_name',
                theme: themeData,
                locale: locale,
                supportedLocales: supportedLocales,
                localizationsDelegates: localizationsDelegates,
                localeResolutionCallback: localeResolutionCallback,
                routes: Routes.routes,
                onUnknownRoute: (settings) {
                  return MaterialPageRoute(builder: (ctx) => HomePage());
                },
              ),
            );
          },
        );
      },
    );
  }
}
