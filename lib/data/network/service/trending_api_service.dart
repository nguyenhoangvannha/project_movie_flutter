import 'package:chopper/chopper.dart';
import 'package:project_movie/data/network/converter/built_value_converter.dart';
import 'package:project_movie/data/network/interceptor/network_interceptor.dart';
import 'package:project_movie/data/network/model/movie_response_model.dart';

import '../../../global/config.dart' as Config;
import 'movie_api_service.dart';

part 'trending_api_service.chopper.dart';

@ChopperApi(baseUrl: '/discover')
abstract class TrendingApiService extends ChopperService
    implements MovieApiService {
  //Generate code: flutter packages pub run build_runner build //watch
  // flutter packages pub run build_runner clean

  @Get(path: '/movie')
  Future<Response<MovieResponseModel>> getTrendingMovies({
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
