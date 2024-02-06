import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:project_movie_flutter/component/app_injector.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import './ui/feature/home/home_page.dart';
import 'component/routes.dart';
import 'ui/bloc/simple_bloc_delegate.dart';
import 'ui/global/application.dart';

//todo: animation
void main() {
  initApp();
  runApp(const MyApp());
}

void initApp() {
  // if ([TargetPlatform.windows, TargetPlatform.macOS, TargetPlatform.linux]
  //     .contains(defaultTargetPlatform)) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }
  //
  // if (kIsWeb) {
  //   // Change default factory on the web
  //   databaseFactory = databaseFactoryFfiWeb;
  // }

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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Application(
      builder: (bCtx, initData) {
        _setSystemUI(initData.themeData!.brightness);
        return MaterialApp(
          title: 'app_name',
          theme: initData.themeData,
          //darkTheme: appThemeData[AppTheme.Dark],
          locale: initData.locale,
          supportedLocales: initData.supportedLocales!,
          localizationsDelegates: initData.localizationsDelegates,
          localeResolutionCallback: initData.localeResolutionCallback as Locale?
              Function(Locale?, Iterable<Locale>)?,
          routes: Routes.routes,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => const HomePage());
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
