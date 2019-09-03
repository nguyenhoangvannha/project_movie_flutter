import 'package:chopper/chopper.dart';
import 'package:project_movie/data/network/model/movie_response_model.dart';

abstract class MovieApiService {
  Future<Response<MovieResponseModel>> getMovies();
}
