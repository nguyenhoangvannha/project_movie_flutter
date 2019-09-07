import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/bloc/movie_detail/movie_details_bloc.dart';
import 'package:project_movie_flutter/bloc/trending_movie/trending_movie_bloc.dart';
import 'package:project_movie_flutter/data/network/service/movie_api_service.dart';
import 'package:project_movie_flutter/data/respository/movie_repository.dart';

class AppInit {
  static AppInit _instance;

  List<BlocProvider> _providers;
  MovieApiService _movieApiService;
  MovieRepository _movieRepository;

  AppInit._() {
    _movieApiService = MovieApiService.create();
    _movieRepository = MovieRepository(movieApiService: _movieApiService);
    _providers = [
      BlocProvider<TrendingMovieBloc>(
        builder: (context) => TrendingMovieBloc(repository: _movieRepository),
      ),
      BlocProvider<MovieDetailsBloc>(
        builder: (context) => MovieDetailsBloc(repository: _movieRepository),
      ),
    ];
  }

  static AppInit get instance {
    if (_instance == null) {
      _instance = AppInit._();
    }
    return _instance;
  }

  List<BlocProvider> get providers => _providers;
}
