// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$TrendingApiService extends TrendingApiService {
  _$TrendingApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = TrendingApiService;

  Future<Response<MovieResponseModel>> getTrendingMovies(
      {String apiKey = Config.API_KEY,
      String sortBy = 'popularity.desc',
      int page = 1}) {
    final $url = '/discover/movie';
    final Map<String, dynamic> $params = {
      'api_key': apiKey,
      'sort_by': sortBy,
      'page': page
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> getMovies() {
    return getTrendingMovies();
  }
}
