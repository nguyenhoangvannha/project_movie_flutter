import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

import 'cast_model.dart';

part 'credits_response_model.g.dart';

abstract class CreditsResponseModel
    implements Built<CreditsResponseModel, CreditsResponseModelBuilder> {
  CreditsResponseModel._();

  factory CreditsResponseModel([updates(CreditsResponseModelBuilder b)]) =
      _$CreditsResponseModel;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'cast')
  BuiltList<CastModel> get casts;

  String toJson() {
    return json.encode(
        serializers.serializeWith(CreditsResponseModel.serializer, this));
  }

  static CreditsResponseModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        CreditsResponseModel.serializer, json.decode(jsonString));
  }

  static Serializer<CreditsResponseModel> get serializer =>
      _$creditsResponseModelSerializer;
}
