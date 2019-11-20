import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

import 'video_model.dart';

part 'video_response_model.g.dart';

abstract class VideoResponseModel
    implements Built<VideoResponseModel, VideoResponseModelBuilder> {
  VideoResponseModel._();

  factory VideoResponseModel([updates(VideoResponseModelBuilder b)]) =
      _$VideoResponseModel;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'results')
  BuiltList<VideoModel> get videos;

  String toJson() {
    return json
        .encode(serializers.serializeWith(VideoResponseModel.serializer, this));
  }

  static VideoResponseModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoResponseModel.serializer, json.decode(jsonString));
  }

  static Serializer<VideoResponseModel> get serializer =>
      _$videoResponseModelSerializer;
}
