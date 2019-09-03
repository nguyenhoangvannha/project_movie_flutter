import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/network/model/cast_model.dart';
import 'package:project_movie/data/network/model/movie_model.dart';
import 'package:project_movie/data/network/model/video_model.dart';
import 'package:project_movie/data/network/service/movie_api_service.dart';

import '../../global/api_config.dart' as ApiConfig;
import 'entity/cast.dart';
import 'entity/movie.dart';
import 'entity/video.dart';

class MovieRepository {
  final MovieApiService movieApiService;

  MovieRepository({@required this.movieApiService});

  Future<List<Movie>> getTrendingMovies({int page = 1}) async {
    try {
      final data = await movieApiService.getTrendingMovies(page: page);
      return _mapMoviesResponseToList(data.body.movies);
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      final data = await movieApiService.getNowPlaying(page: page);
      return _mapMoviesResponseToList(data.body.movies);
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    try {
      final data = await movieApiService.searchMovies(query: query, page: page);
      return _mapMoviesResponseToList(data.body.movies);
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Video>> getVideoTrailer({@required int movieId}) async {
    try {
      final data = await movieApiService.getVideoTrailer(movieId: movieId);
      return _mapVideosResponseToList(data.body.videos);
    } catch (ex) {
      throw ex;
    }
  }

  Future<Movie> getMovieDetail({@required int movieId}) async {
    try {
      final data = await movieApiService.getMovieDetail(movieId: movieId);
      return data.body;
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Cast>> getMovieCredits({@required int movieId}) async {
    try {
      final data = await movieApiService.getMovieCredits(movieId: movieId);
      return _mapCreditsResponseToList(data.body.casts);
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Movie>> recommendationsMovies(
      {@required int movieId, int page = 1}) async {
    try {
      final data = await movieApiService.recommendationsMovies(
          movieId: movieId, page: page);
      return _mapMoviesResponseToList(data.body.movies);
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Movie>> similarMovies(
      {@required int movieId, int page = 1}) async {
    try {
      final data =
      await movieApiService.similarMovies(movieId: movieId, page: page);
      return _mapMoviesResponseToList(data.body.movies);
    } catch (ex) {
      throw ex;
    }
  }

  List<Movie> _mapMoviesResponseToList(BuiltList<MovieModel> movies) {
    return movies.map((movieModel) {
      return Movie(
          id: movieModel.id,
          title: movieModel.title,
          overview: movieModel.overview,
          posterPath: '${ApiConfig.BASE_POSTER_URL}${movieModel.posterPath}',
          voteAverage: movieModel.voteAverage);
    }).toList();
  }

  List<Video> _mapVideosResponseToList(BuiltList<VideoModel> movies) {
    return movies.map((m) {
      return Video(
          id: m.id,
          key: m.key,
          name: m.name,
          site: m.site,
          size: m.size,
          type: m.type);
    }).toList();
  }

  List<Cast> _mapCreditsResponseToList(BuiltList<CastModel> casts) {
    return casts.map((castModel) {
      return Cast(
          id: castModel.id,
          castId: castModel.castId,
          name: castModel.name,
          profilePath: '${ApiConfig.BASE_POSTER_URL}${castModel.profilePath}');
    }).toList();
  }
}
