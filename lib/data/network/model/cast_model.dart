import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_movie_flutter/data/network/model/serializers.dart';

part 'cast_model.g.dart';

abstract class CastModel implements Built<CastModel, CastModelBuilder> {
  CastModel._();

  factory CastModel([updates(CastModelBuilder b)]) = _$CastModel;

  @BuiltValueField(wireName: 'cast_id')
  int? get castId;

  @BuiltValueField(wireName: 'character')
  String? get character;

  @BuiltValueField(wireName: 'credit_id')
  String? get creditId;

  @BuiltValueField(wireName: 'gender')
  int? get gender;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'order')
  int? get order;

  @BuiltValueField(wireName: 'profile_path')
  String? get profilePath;

  String toJson() {
    return json.encode(serializers.serializeWith(CastModel.serializer, this));
  }

  static CastModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CastModel.serializer, json.decode(jsonString));
  }

  static Serializer<CastModel> get serializer => _$castModelSerializer;
}
