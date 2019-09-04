// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$MovieApiService extends MovieApiService {
  _$MovieApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = MovieApiService;

  Future<Response<MovieResponseModel>> getTrendingMovies(
      {String apiKey = ApiConfig.API_KEY,
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

  Future<Response<MovieResponseModel>> getNowPlaying(
      {String apiKey = ApiConfig.API_KEY, int page = 1}) {
    final $url = '/movie/now_playing';
    final Map<String, dynamic> $params = {'api_key': apiKey, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  Future<Response<MovieResponseModel>> searchMovies(
      {String apiKey = ApiConfig.API_KEY, String query = '', int page = 1}) {
    final $url = '/search/movie';
    final Map<String, dynamic> $params = {
      'api_key': apiKey,
      'query': query,
      'page': page
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  Future<Response<VideoResponseModel>> getVideoTrailer(
      {int movieId, String apiKey = ApiConfig.API_KEY}) {
    final $url = '/movie/${movieId}/videos';
    final Map<String, dynamic> $params = {'api_key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<VideoResponseModel, VideoResponseModel>($request);
  }

  Future<Response<MovieModel>> getMovieDetail(
      {int movieId, String apiKey = ApiConfig.API_KEY}) {
    final $url = '/movie/${movieId}';
    final Map<String, dynamic> $params = {'api_key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieModel, MovieModel>($request);
  }

  Future<Response<CreditsResponseModel>> getMovieCredits(
      {int movieId, String apiKey = ApiConfig.API_KEY}) {
    final $url = '/movie/${movieId}/credits';
    final Map<String, dynamic> $params = {'api_key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<CreditsResponseModel, CreditsResponseModel>($request);
  }

  Future<Response<MovieResponseModel>> recommendationsMovies(
      {int movieId, String apiKey = ApiConfig.API_KEY, int page = 1}) {
    final $url = '/movie/${movieId}/recommendations';
    final Map<String, dynamic> $params = {'api_key': apiKey, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  Future<Response<MovieResponseModel>> similarMovies(
      {int movieId, String apiKey = ApiConfig.API_KEY, int page = 1}) {
    final $url = '/movie/${movieId}/similar';
    final Map<String, dynamic> $params = {'api_key': apiKey, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }
}
