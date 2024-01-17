import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Movie {
  final double? popularity;

  final int? voteCount;

  final bool? video;

  final String? posterPath;

  final int? id;

  final bool? adult;

  final String? backdropPath;

  final String? originalLanguage;

  final String? originalTitle;

  final List<int>? genreIds;

  final String? title;

  final double? voteAverage;

  final String? overview;

  final String? releaseDate;

  final double? runTime;

  bool? finished;

  Movie({
    this.popularity,
    required this.posterPath,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.finished,
    this.adult,
    this.voteCount,
    this.video,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.runTime,
  });

  @override
  String toString() {
    return 'Movie{popularity: $popularity, voteCount: $voteCount, video: $video, posterPath: $posterPath, id: $id, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, genreIds: $genreIds, title: $title, voteAverage: $voteAverage, overview: $overview, releaseDate: $releaseDate, runTime: $runTime}';
  }
}
