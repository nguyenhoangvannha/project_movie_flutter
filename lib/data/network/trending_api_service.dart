import 'package:chopper/chopper.dart';
import 'package:project_movie/data/model/movie_response.dart';

import '../../global/config.dart' as Config;
import 'built_value_converter.dart';
import 'interceptor/network_interceptor.dart';

part 'trending_api_service.chopper.dart';

@ChopperApi(baseUrl: '/discover')
abstract class TrendingApiService extends ChopperService {
  //Generate code: flutter packages pub run build_runner build //watch
  // flutter packages pub run build_runner clean

  @Get(path: '/movie')
  Future<Response<MovieResponse>> getTrendingMovies({
    @Query('api_key') String apiKey = Config.API_KEY,
    @Query('sort_by') String sortBy = 'popularity.desc',
    @Query('page') int page = 1,
  });

  static TrendingApiService create() {
    final client = ChopperClient(
        baseUrl: '${Config.BASE_API_URL}',
        services: [
          _$TrendingApiService(),
        ],
        converter: BuiltValueConverter(), //JsonConverter()
        interceptors: [
          HttpLoggingInterceptor(),
          NetworkInterceptor(),
          //HeadersInterceptor({'name': 'value'}),
//          (Request req) async {
//            if(req.method == HttpMethod.Get){
//
//            }
//            return req;
//          },
        ]);
    return _$TrendingApiService(client);
  }
}
