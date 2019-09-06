import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Movie extends Equatable {
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

  final double runTime;

  Movie({this.popularity,
    @required this.posterPath,
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.overview,
    @required this.releaseDate,
    this.adult,
    this.voteCount,
    this.video,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.runTime,
  }) :super([id]);

  @override
  String toString() {
    return 'Movie{posterPath: $posterPath, id: $id, title: $title, voteAverage: $voteAverage}';
  }
}
