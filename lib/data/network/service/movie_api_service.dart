import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';
import 'package:project_movie_flutter/component/api_config.dart';
import 'package:project_movie_flutter/data/network/service/built_value_converter.dart';

import '../interceptor/network_interceptor.dart';
import '../model/credits_response_model.dart';
import '../model/movie_model.dart';
import '../model/movie_response_model.dart';
import '../model/video_response_model.dart';

part 'movie_api_service.chopper.dart';

@ChopperApi()
abstract class MovieApiService extends ChopperService {
  @Get(path: '/discover/movie')
  Future<Response<MovieResponseModel>> getTrendingMovies({
    @Query('api_key') String apiKey = ApiConfig.API_KEY,
    @Query('sort_by') String sortBy = 'popularity.desc',
    @Query('page') int page = 1,
  });

  @Get(path: '/movie/now_playing')
  Future<Response<MovieResponseModel>> getNowPlaying({
    @Query('api_key') String apiKey = ApiConfig.API_KEY,
    @Query('page') int page = 1,
  });

  @Get(path: '/search/movie')
  Future<Response<MovieResponseModel>> searchMovies(
      @Query("query") String query,
      {@Query('api_key') String apiKey = ApiConfig.API_KEY,
        @Query('page') int page = 1});

  @Get(path: '/movie/{movieId}/videos')
  Future<Response<VideoResponseModel>> getVideoTrailer(
      {@Path("movieId") @required int movieId,
        @Query('api_key') String apiKey = ApiConfig.API_KEY});

  @Get(path: '/movie/{movieId}') //&append_to_response=videos
  Future<Response<MovieModel>> getMovieDetail(
      {@Path("movieId") @required int movieId,
        @Query('api_key') String apiKey = ApiConfig.API_KEY});

  @Get(path: '/movie/{movieId}/credits')
  Future<Response<CreditsResponseModel>> getMovieCredits(
      {@Path("movieId") @required int movieId,
        @Query('api_key') String apiKey = ApiConfig.API_KEY});

  @Get(path: '/movie/{movieId}/recommendations')
  Future<Response<MovieResponseModel>> recommendationsMovies(
      {@Path("movieId") @required int movieId,
        @Query('api_key') String apiKey = ApiConfig.API_KEY,
        @Query('page') int page = 1});

  @Get(path: '/movie/{movieId}/similar')
  Future<Response<MovieResponseModel>> similarMovies(
      {@Path("movieId") @required int movieId,
        @Query('api_key') String apiKey = ApiConfig.API_KEY,
        @Query('page') int page = 1});

  static MovieApiService create() {
    final client = ChopperClient(
        baseUrl: '${ApiConfig.BASE_API_URL}',
        services: [
          _$MovieApiService(),
        ],
        converter: BuiltValueConverter(),
        errorConverter: JsonConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
          NetworkInterceptor(),
        ]);
    return _$MovieApiService(client);
  }
}
