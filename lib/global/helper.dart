import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:project_movie/bloc/search/search_bloc.dart';
import 'package:project_movie/bloc/simple_bloc_delegate.dart';
import 'package:project_movie/bloc/trending/trending_bloc.dart';
import 'package:project_movie/data/network/service/movie_api_service.dart';
import 'package:project_movie/data/respository/movie_repository.dart';

class Helper {
  static Helper _instance;
  MovieApiService _movieApiService;
  MovieRepository _movieRepository;
  List<BlocProvider> _providers;

  Helper._() {
    _movieApiService = MovieApiService.create();
    _movieRepository = MovieRepository(movieApiService: _movieApiService);
    _providers = [
      BlocProvider<TrendingBloc>(
        builder: (BuildContext context) =>
            TrendingBloc(repository: _movieRepository),
      ),
      BlocProvider<SearchBloc>(
        builder: (BuildContext context) =>
            SearchBloc(repository: _movieRepository),
      )
    ];
  }

  static Helper getInstance() {
    if (_instance == null) {
      _instance = Helper._();
    }
    return _instance;
  }

  List<BlocProvider> get providers => _providers;

  void initApp() {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    setupLogging();
  }

  void setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('${rec.level.name} : ${rec.time}: ${rec.message}');
    });
  }
}
