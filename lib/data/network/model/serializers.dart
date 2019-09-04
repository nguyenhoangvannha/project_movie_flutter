import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'cast_model.dart';
import 'credits_response_model.dart';
import 'movie_model.dart';
import 'movie_response_model.dart';
import 'video_model.dart';
import 'video_response_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  MovieModel,
  MovieResponseModel,
  CastModel,
  CreditsResponseModel,
  VideoModel,
  VideoResponseModel
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
