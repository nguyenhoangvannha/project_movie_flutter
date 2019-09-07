import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:project_movie/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:project_movie/bloc/similar/similar_bloc.dart';
import 'package:project_movie/global/language/bloc/bloc.dart';

import '../../bloc/favorite/favorite_bloc.dart';
import '../../bloc/search/search_bloc.dart';
import '../../bloc/simple_bloc_delegate.dart';
import '../../bloc/trending/trending_bloc.dart';
import '../../data/network/service/movie_api_service.dart';
import '../../data/respository/movie_repository.dart';
import '../theme/bloc/theme_bloc.dart';

class Helper {
  static Helper _instance;
  MovieApiService _movieApiService;
  MovieRepository _movieRepository;
  List<BlocProvider> _providers;

  Helper._() {
    _movieApiService = MovieApiService.create();
    _movieRepository = MovieRepository(movieApiService: _movieApiService);
    _providers = [
      BlocProvider<ThemeBloc>(
        builder: (BuildContext context) => ThemeBloc(),
      ),
      BlocProvider<TrendingBloc>(
        builder: (BuildContext context) =>
            TrendingBloc(repository: _movieRepository),
      ),
      BlocProvider<SearchBloc>(
        builder: (BuildContext context) =>
            SearchBloc(repository: _movieRepository),
      ),
      BlocProvider<FavoriteBloc>(
        builder: (BuildContext context) =>
            FavoriteBloc(repository: _movieRepository),
      ),
      BlocProvider<MovieDetailBloc>(
        builder: (BuildContext context) =>
            MovieDetailBloc(repository: _movieRepository),
      ),
      BlocProvider<SimilarBloc>(
        builder: (BuildContext context) =>
            SimilarBloc(repository: _movieRepository),
      ),
      BlocProvider<LocalizationsBloc>(
        builder: (BuildContext context) =>
            LocalizationsBloc(),
      ),
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
