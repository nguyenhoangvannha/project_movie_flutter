import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

part 'video_model.g.dart';

abstract class VideoModel implements Built<VideoModel, VideoModelBuilder> {
  VideoModel._();

  factory VideoModel([updates(VideoModelBuilder b)]) = _$VideoModel;

  @BuiltValueField(wireName: 'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: 'iso_639_1')
  String get iso6391;

  @nullable
  @BuiltValueField(wireName: 'iso_3166_1')
  String get iso31661;

  @nullable
  @BuiltValueField(wireName: 'key')
  String get key;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'site')
  String get site;

  @nullable
  @BuiltValueField(wireName: 'size')
  int get size;

  @nullable
  @BuiltValueField(wireName: 'type')
  String get type;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoModel.serializer, this));
  }

  static VideoModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoModel.serializer, json.decode(jsonString));
  }

  static Serializer<VideoModel> get serializer => _$videoModelSerializer;
}
