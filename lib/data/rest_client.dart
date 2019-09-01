import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RestClient{
  var logger = Logger();
  Dio dio;
  String _baseUrl = 'https://api.themoviedb.org/3';
  String _apiKey = 'afc072076fd42b05abd1431a0f45c601';
  RestClient(){
    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          options.queryParameters['api_key'] = _apiKey;
          logger.i('OnRequest', options.queryParameters.toString());
          return options; //continue
        },
        onResponse:(Response response) {
          logger.i('OnResponse', response.toString());
          return response; // continue
        },
        onError: (DioError e) {
          logger.e('OnError', e.message, e.stackTrace);
          return  e;//continue
        }
    ));
  }

  Future<Response> getPopularMovies({int page = 1}) async {
    try {
      Response response = await dio.get("/discover/movie?sort_by=popularity.desc&page=$page");
      return response;
    } catch (e) {
      throw e;
    }
  }
}