import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';
import 'package:project_movie_flutter/domain/usecase/movie/export.dart';
import 'package:project_movie_flutter/domain/usecase/movie/favorite/add_favorite.dart';
import 'package:project_movie_flutter/domain/usecase/movie/favorite/remove_favorite.dart';
import 'package:project_movie_flutter/domain/usecase/movie/favorite/update_favorite.dart';
import 'package:project_movie_flutter/ui/bloc/favourite_movie/favourite_movie_bloc.dart';
import 'package:project_movie_flutter/ui/bloc/search_movie/search_movie_bloc.dart';
import 'package:project_movie_flutter/ui/bloc/trending_movie/trending_movie_bloc.dart';

class AppBlocDelegate {
  static AppBlocDelegate _instance;

  List<BlocProvider> _blocProviders;
  List<RepositoryProvider> _repositoryProviders;

  AppBlocDelegate._(BuildContext context) {
    final MovieRepository movieRepository =
        Injector.appInstance.getDependency();

    _repositoryProviders = [
      RepositoryProvider<GetMovieDetail>(
        create: (context) => GetMovieDetail(movieRepository),
      ),
      RepositoryProvider<GetMovieCredits>(
        create: (context) => GetMovieCredits(movieRepository),
      ),
      RepositoryProvider<GetSimilarMovies>(
        create: (context) => GetSimilarMovies(movieRepository),
      ),
      RepositoryProvider<GetRecommendationsMovies>(
        create: (context) => GetRecommendationsMovies(movieRepository),
      ),
      RepositoryProvider<GetVideoTrailer>(
        create: (context) => GetVideoTrailer(movieRepository),
      ),
    ];

    _blocProviders = [
      BlocProvider<TrendingMovieBloc>(
        create: (context) => TrendingMovieBloc(
            getTrendingMovies: GetTrendingMovie(movieRepository)),
      ),
      BlocProvider<SearchMovieBloc>(
        create: (context) =>
            SearchMovieBloc(searchMovie: SearchMovies(movieRepository)),
      ),
      BlocProvider<FavouriteMovieBloc>(
        create: (context) => FavouriteMovieBloc(
            addFavoriteMovie: AddFavoriteMovie(movieRepository),
            getFavoriteMovie: GetFavoriteMovies(movieRepository),
            removeFavoriteMovie: RemoveFavoriteMovie(movieRepository),
            updateFavoriteMovie: UpdateFavoriteMovie(movieRepository)),
      ),
    ];
  }

  static AppBlocDelegate instance(BuildContext context) {
    if (_instance == null) {
      _instance = AppBlocDelegate._(context);
    }
    return _instance;
  }

  List<BlocProvider> get blocProviders => _blocProviders;

  List<RepositoryProvider> get repositoryProviders => _repositoryProviders;
}
