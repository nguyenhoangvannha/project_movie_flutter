import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

part 'cast_model.g.dart';

abstract class CastModel implements Built<CastModel, CastModelBuilder> {
  CastModel._();

  factory CastModel([updates(CastModelBuilder b)]) = _$CastModel;

  @nullable
  @BuiltValueField(wireName: 'cast_id')
  int get castId;

  @nullable
  @BuiltValueField(wireName: 'character')
  String get character;

  @nullable
  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @nullable
  @BuiltValueField(wireName: 'gender')
  int get gender;

  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'order')
  int get order;

  @nullable
  @BuiltValueField(wireName: 'profile_path')
  String get profilePath;

  String toJson() {
    return json.encode(serializers.serializeWith(CastModel.serializer, this));
  }

  static CastModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        CastModel.serializer, json.decode(jsonString));
  }

  static Serializer<CastModel> get serializer => _$castModelSerializer;
}
