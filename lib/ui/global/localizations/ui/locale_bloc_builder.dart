import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../localizations_delegates.dart';

class LocaleBlocBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      Locale? locale,
      List<Locale>? supportedLocales,
      List<LocalizationsDelegate>? localizationsDelegates,
      Function localeResolutionCallback) builder;

  const LocaleBlocBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationsBloc>(
      create: (BuildContext context) => LocalizationsBloc.instance!,
      child: BlocBuilder<LocalizationsBloc, LocalizationsState>(
          builder: (bCtx, localeState) {
        return builder(
            bCtx,
            localeState.locale,
            LocalizationsDelegates.instance!.supportedLocales,
            LocalizationsDelegates.instance!.localizationsDelegates,
            LocalizationsDelegates.instance!.localeResolutionCallback);
      }),
    );
  }
}
