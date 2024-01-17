import 'package:project_movie_flutter/data/db/dao/movie_dao.dart';
import 'package:project_movie_flutter/data/network/exception/server_exception.dart';
import 'package:project_movie_flutter/data/network/service/movie_api_service.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';
import 'package:project_movie_flutter/util/resource.dart';

import 'mapper/mapper.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieApiService movieApiService;
  MovieDao movieDao;
  final Mapper mapper;

  static const int _TIME_OUT = 10;

  MovieRepositoryImpl(
      {required this.movieApiService,
      required this.movieDao,
      this.mapper = const Mapper()});

  @override
  Future<DataResource<List<Movie>>> getTrendingMovies({int? page = 1}) async {
    try {
      final res = await movieApiService
          .getTrendingMovies(page: page)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMoviesResponseToList(res.body!.movies!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex, stack) {
      print(stack);
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Movie>>> getNowPlaying({int? page = 1}) async {
    try {
      final res = await movieApiService
          .getNowPlaying(page: page)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMoviesResponseToList(res.body!.movies!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Movie>>> searchMovies(String query,
      {int? page = 1}) async {
    try {
      final res = await movieApiService
          .searchMovies(query, page: page)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMoviesResponseToList(res.body!.movies!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Video>>> getVideoTrailer(int? movieId) async {
    try {
      final res = await movieApiService
          .getVideoTrailer(movieId: movieId)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapVideosResponseToList(res.body!.videos!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<Movie>> getMovieDetail(int? movieId) async {
    try {
      final res = await movieApiService
          .getMovieDetail(movieId: movieId)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMovieResponseToMovie(res.body!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Cast>>> getMovieCredits(int? movieId) async {
    try {
      final res = await movieApiService
          .getMovieCredits(movieId: movieId)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapCreditsResponseToList(res.body!.casts!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Movie>>> recommendationsMovies(int? movieId,
      {int? page = 1}) async {
    try {
      final res = await movieApiService
          .recommendationsMovies(movieId: movieId, page: page)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMoviesResponseToList(res.body!.movies!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Movie>>> similarMovies(int? movieId,
      {int? page = 1}) async {
    try {
      final res = await movieApiService
          .similarMovies(movieId: movieId, page: page)
          .timeout(const Duration(seconds: _TIME_OUT));
      if (res.isSuccessful) {
        return DataResource(ResourceType.Success,
            data: mapper.mapMoviesResponseToList(res.body!.movies!));
      } else {
        return DataResource(ResourceType.Error,
            exception: ServerException.fromJson(
                httpStatusCode: res.statusCode,
                errorBody: res.error as Map<String, dynamic>));
      }
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<List<Movie>>> getFavoriteMovies({int? page}) async {
    try {
      final movies = await movieDao.getAllMovies();
      return DataResource(ResourceType.Success,
          data: mapper.mapLocalMoviesToEntities(movies));
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<bool>> addFavoriteMovie(Movie movie) async {
    try {
      await movieDao.insertMovie(mapper.mapMovieEntityToLocalMovie(movie));
      return DataResource(ResourceType.Success, data: true);
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<bool>> removeFavoriteMovie(int movieId) async {
    try {
      await movieDao.deleteMovie(movieId);
      return DataResource(ResourceType.Success, data: true);
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }

  @override
  Future<DataResource<bool>> updateFavoriteMovie(Movie movie) async {
    try {
      await movieDao.updateMovie(mapper.mapMovieEntityToLocalMovie(movie));
      return DataResource(ResourceType.Success, data: true);
    } catch (ex) {
      return DataResource(ResourceType.Error, exception: ex);
    }
  }
}
