import 'package:meta/meta.dart';

class Movie {
  final double popularity;

  final int voteCount;

  final bool video;

  final String posterPath;

  final int id;

  final bool adult;

  final String backdropPath;

  final String originalLanguage;

  final String originalTitle;

  final List<int> genreIds;

  final String title;

  final double voteAverage;

  final String overview;

  final String releaseDate;

  Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      @required this.posterPath,
      @required this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
        @required this.releaseDate});

  @override
  String toString() {
    return 'Movie{posterPath: $posterPath, id: $id, title: $title, voteAverage: $voteAverage}';
  }
}
