// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MovieApiService extends MovieApiService {
  _$MovieApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieApiService;

  @override
  Future<Response<MovieResponseModel>> getTrendingMovies({
    String apiKey = ApiConfig.API_KEY,
    String sortBy = 'popularity.desc',
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/discover/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'api_key': apiKey,
      'sort_by': sortBy,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> getNowPlaying({
    String apiKey = ApiConfig.API_KEY,
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/movie/now_playing');
    final Map<String, dynamic> $params = <String, dynamic>{
      'api_key': apiKey,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> searchMovies(
    String query, {
    String apiKey = ApiConfig.API_KEY,
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/search/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'api_key': apiKey,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  @override
  Future<Response<VideoResponseModel>> getVideoTrailer({
    required int? movieId,
    String apiKey = ApiConfig.API_KEY,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/videos');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<VideoResponseModel, VideoResponseModel>($request);
  }

  @override
  Future<Response<MovieModel>> getMovieDetail({
    required int? movieId,
    String apiKey = ApiConfig.API_KEY,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieModel, MovieModel>($request);
  }

  @override
  Future<Response<CreditsResponseModel>> getMovieCredits({
    required int? movieId,
    String apiKey = ApiConfig.API_KEY,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/credits');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CreditsResponseModel, CreditsResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> recommendationsMovies({
    required int? movieId,
    String apiKey = ApiConfig.API_KEY,
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/recommendations');
    final Map<String, dynamic> $params = <String, dynamic>{
      'api_key': apiKey,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> similarMovies({
    required int? movieId,
    String apiKey = ApiConfig.API_KEY,
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/similar');
    final Map<String, dynamic> $params = <String, dynamic>{
      'api_key': apiKey,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }
}
