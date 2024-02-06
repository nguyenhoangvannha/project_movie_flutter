// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieApiService extends MovieApiService {
  _$MovieApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieApiService;

  @override
  Future<Response<MovieResponseModel>> getTrendingMovies({
    String sortBy = 'popularity.desc',
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/discover/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
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
  Future<Response<MovieResponseModel>> getNowPlaying({int? page = 1}) {
    final Uri $url = Uri.parse('/movie/now_playing');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
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
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/search/movie');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
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
  Future<Response<VideoResponseModel>> getVideoTrailer(
      {required int? movieId}) {
    final Uri $url = Uri.parse('/movie/${movieId}/videos');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VideoResponseModel, VideoResponseModel>($request);
  }

  @override
  Future<Response<MovieModel>> getMovieDetail({required int? movieId}) {
    final Uri $url = Uri.parse('/movie/${movieId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MovieModel, MovieModel>($request);
  }

  @override
  Future<Response<CreditsResponseModel>> getMovieCredits(
      {required int? movieId}) {
    final Uri $url = Uri.parse('/movie/${movieId}/credits');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CreditsResponseModel, CreditsResponseModel>($request);
  }

  @override
  Future<Response<MovieResponseModel>> recommendationsMovies({
    required int? movieId,
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/recommendations');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
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
    int? page = 1,
  }) {
    final Uri $url = Uri.parse('/movie/${movieId}/similar');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MovieResponseModel, MovieResponseModel>($request);
  }
}
