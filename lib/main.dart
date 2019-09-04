import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/ui/feature/home/home_page.dart';

import 'global/helper.dart';

void main() {
  Helper.getInstance().initApp();
  runApp(MultiBlocProvider(
      providers: Helper
          .getInstance()
          .providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Movie',
      home: HomePage(),
    );
  }
}
