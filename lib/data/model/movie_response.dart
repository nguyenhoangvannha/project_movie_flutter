import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'movie.dart';
import 'serializers.dart';

part 'movie_response.g.dart';

abstract class MovieResponse
    implements Built<MovieResponse, MovieResponseBuilder> {
  MovieResponse._();

  factory MovieResponse([updates(MovieResponseBuilder b)]) = _$MovieResponse;

  @BuiltValueField(wireName: 'page')
  int get page;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  @BuiltValueField(wireName: 'results')
  BuiltList<Movie> get movies;

  String toJson() {
    return json
        .encode(serializers.serializeWith(MovieResponse.serializer, this));
  }

  static MovieResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        MovieResponse.serializer, json.decode(jsonString));
  }

  static Serializer<MovieResponse> get serializer => _$movieResponseSerializer;
}
