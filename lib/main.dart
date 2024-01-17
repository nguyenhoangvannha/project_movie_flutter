import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:project_movie_flutter/component/app_injector.dart';

import './ui/feature/home/home_page.dart';
import 'component/routes.dart';
import 'ui/bloc/simple_bloc_delegate.dart';
import 'ui/global/application.dart';

//todo: animation
void main() {
  initApp();
  runApp(MyApp());
}

void initApp() {
  setupLogging();

  AppInjector.init();

  Bloc.observer = SimpleBlocDelegate();
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
    return Application(
      builder: (bCtx, initData) {
        _setSystemUI(initData.themeData.brightness);
        return MaterialApp(
          title: 'app_name',
          theme: initData.themeData,
          //darkTheme: appThemeData[AppTheme.Dark],
          locale: initData.locale,
          supportedLocales: initData.supportedLocales,
          localizationsDelegates: initData.localizationsDelegates,
          localeResolutionCallback: initData.localeResolutionCallback,
          routes: Routes.routes,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => HomePage());
          },
        );
      },
    );
  }

  _setSystemUI(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
    ));
  }
}
