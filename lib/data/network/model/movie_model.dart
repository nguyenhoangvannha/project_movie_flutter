import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie/data/network/model/serializers.dart';

part 'movie_model.g.dart';

abstract class MovieModel implements Built<MovieModel, MovieModelBuilder> {
  MovieModel._();

  factory MovieModel([updates(MovieModelBuilder b)]) = _$MovieModel;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'video')
  bool get video;

  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  String toJson() {
    return json.encode(serializers.serializeWith(MovieModel.serializer, this));
  }

  static MovieModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        MovieModel.serializer, json.decode(jsonString));
  }

  static Serializer<MovieModel> get serializer => _$movieModelSerializer;
}
