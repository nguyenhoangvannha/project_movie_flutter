import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/component/bloc_delegate.dart';
import 'package:project_movie_flutter/ui/global/theme/ui/theme_bloc_builder.dart';

import 'localizations/ui/locale_bloc_builder.dart';

//This widget contains  init data, theme and locale manager and provide that data to child widget
class Application extends StatelessWidget {
  final Widget Function(BuildContext context, InitData initData) builder;

  Application({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: AppBlocDelegate.instance(context).repositoryProviders,
      child: MultiBlocProvider(
        providers: AppBlocDelegate.instance(context).blocProviders,
        child: LocaleBlocBuilder(
          builder: (lBBContext, locale, supportedLocales,
              localizationsDelegates, localeResolutionCallback) {
            return ThemeBlocBuilder(
              builder: (tBBContext, themeData) {
                InitData initData = InitData(
                    themeData,
                    locale,
                    supportedLocales,
                    localizationsDelegates,
                    localeResolutionCallback);
                return builder(tBBContext, initData);
              },
            );
          },
        ),
      ),
    );
  }
}

class InitData {
  ThemeData themeData;
  Locale locale;
  List<Locale> supportedLocales;
  List<LocalizationsDelegate> localizationsDelegates;
  Function localeResolutionCallback;

  InitData(this.themeData, this.locale, this.supportedLocales,
      this.localizationsDelegates, this.localeResolutionCallback);
}
