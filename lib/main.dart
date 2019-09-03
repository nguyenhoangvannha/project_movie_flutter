import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:project_movie/data/network/service/movie_api_service.dart';

import 'bloc/simple_bloc_delegate.dart';
import 'bloc/trending/bloc.dart';
import 'data/network/service/movie_api_service.dart';
import 'data/respository/movie_repository.dart';
import 'widget/home/home_page.dart';

void main() {
  _settupLogging();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  MovieApiService movieApiService = MovieApiService.create();
  MovieRepository movieRepository = MovieRepository(
      movieApiService: movieApiService);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<TrendingBloc>(
      builder: (BuildContext context) =>
          TrendingBloc(repository: movieRepository),
    )
  ], child: MyApp()));
}

void _settupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name} : ${rec.time}: ${rec.message}');
  });
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
