import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:project_movie/data/network/model/movie_model.dart';
import 'package:project_movie/data/network/model/movie_response_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [MovieModel, MovieResponseModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
