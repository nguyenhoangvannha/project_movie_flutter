import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

part 'movie_model.g.dart';

abstract class MovieModel implements Built<MovieModel, MovieModelBuilder> {
  MovieModel._();

  factory MovieModel([updates(MovieModelBuilder b)]) = _$MovieModel;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @nullable
  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @nullable
  @BuiltValueField(wireName: 'video')
  bool get video;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @nullable
  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @nullable
  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'runtime')
  double get runTime;

  String toJson() {
    return json.encode(serializers.serializeWith(MovieModel.serializer, this));
  }

  static MovieModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        MovieModel.serializer, json.decode(jsonString));
  }

  static Serializer<MovieModel> get serializer => _$movieModelSerializer;
}
