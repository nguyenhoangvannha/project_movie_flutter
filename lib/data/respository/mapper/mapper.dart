import 'package:built_collection/built_collection.dart';
import 'package:project_movie_flutter/component/api_config.dart';
import 'package:project_movie_flutter/data/db/moor_database.dart' as db;
import 'package:project_movie_flutter/data/network/model/cast_model.dart';
import 'package:project_movie_flutter/data/network/model/movie_model.dart';
import 'package:project_movie_flutter/data/network/model/video_model.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';

class Mapper {
  const Mapper();

  List<Movie> mapMoviesResponseToList(BuiltList<MovieModel> movies) {
    return movies.map((movieModel) {
      return mapMovieResponseToMovie(movieModel);
    }).toList();
  }

  Movie mapMovieResponseToMovie(MovieModel movie) {
    return Movie(
        posterPath: '${ApiConfig.BASE_POSTER_URL}${movie.posterPath}',
        id: movie.id ?? -1,
        title: movie.title ?? "",
        voteAverage: movie.voteAverage ?? 0.0,
        overview: movie.overview ?? "0",
        releaseDate:
        movie.releaseDate.isEmpty ? "0000-00-00" : movie.releaseDate,
        originalLanguage: movie.originalLanguage ?? "",
        popularity: movie.popularity ?? 0,
        voteCount: movie.voteCount ?? 0,
        runTime: movie.runTime ?? 0,
        finished: false);
  }

  List<Video> mapVideosResponseToList(BuiltList<VideoModel> movies) {
    return movies.map((m) {
      return Video(
          id: m.id,
          key: m.key,
          name: m.name ?? "",
          site: m.site,
          size: m.size,
          type: m.type);
    }).where((v) {
      return v.site == "YouTube";
    }).toList();
  }

  List<Cast> mapCreditsResponseToList(BuiltList<CastModel> casts) {
    return casts.map((castModel) {
      return Cast(
          id: castModel.id,
          castId: castModel.castId,
          name: castModel.name ?? "",
          profilePath: '${ApiConfig.BASE_POSTER_URL}${castModel.profilePath}');
    }).toList();
  }

  List<Movie> mapLocalMoviesToEntities(List<db.Movie> movies) {
    return movies.map((movie) {
      return mapLocalMovieToMovieEntity(movie);
    }).toList();
  }

  Movie mapLocalMovieToMovieEntity(db.Movie m) {
    return Movie(
        popularity: m.popularity,
        posterPath: m.posterPath,
        id: m.id,
        title: m.title,
        voteAverage: m.voteAverage,
        overview: m.overview,
        releaseDate: m.releaseDate,
        adult: m.adult,
        voteCount: m.voteCount,
        video: m.video,
        backdropPath: m.backdropPath,
        originalLanguage: m.originalLanguage,
        originalTitle: m.originalTitle,
        runTime: m.runTime,
        finished: m.finished);
  }

  db.Movie mapMovieEntityToLocalMovie(Movie m) {
    return db.Movie(
        popularity: m.popularity,
        posterPath: m.posterPath,
        id: m.id,
        title: m.title,
        voteAverage: m.voteAverage,
        overview: m.overview,
        releaseDate: m.releaseDate,
        adult: m.adult,
        voteCount: m.voteCount,
        video: m.video,
        backdropPath: m.backdropPath,
        originalLanguage: m.originalLanguage,
        originalTitle: m.originalTitle,
        runTime: m.runTime,
        finished: m.finished);
  }
}
