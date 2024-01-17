import 'package:project_movie_flutter/util/resource.dart';

import '../entity/cast.dart';
import '../entity/movie.dart';
import '../entity/video.dart';

abstract class MovieRepository {
  Future<DataResource<List<Movie>>> getTrendingMovies({int? page});

  Future<DataResource<List<Movie>>> getNowPlaying({int? page});

  Future<DataResource<List<Movie>>> searchMovies(String query, {int? page});

  Future<DataResource<List<Video>>> getVideoTrailer(int? movieId);

  Future<DataResource<Movie>> getMovieDetail(int? movieId);

  Future<DataResource<List<Cast>>> getMovieCredits(int? movieId);

  Future<DataResource<List<Movie>>> recommendationsMovies(int? movieId,
      {int? page});

  Future<DataResource<List<Movie>>> similarMovies(int? movieId, {int? page});

  Future<DataResource<List<Movie>>> getFavoriteMovies({int? page});

  Future<DataResource<bool>> addFavoriteMovie(Movie movie);

  Future<DataResource<bool>> removeFavoriteMovie(int movieId);

  Future<DataResource<bool>> updateFavoriteMovie(Movie movie);
}
