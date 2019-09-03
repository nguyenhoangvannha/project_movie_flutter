import 'package:project_movie/data/network/service/movie_api_service.dart';

import '../../global/api_config.dart' as ApiConfig;
import 'entity/movie.dart';

class MovieRepository {
  final MovieApiService movieApiService;

  MovieRepository(this.movieApiService);

  Future<List<Movie>> getMovies() async {
    try {
      final data = await movieApiService.getMovies();
      return data.body.movies.map((movieModel) {
        return Movie(
            id: movieModel.id,
            title: movieModel.title,
            overview: movieModel.overview,
            posterPath:
            '${ApiConfig.BASE_POSTER_URL}${movieModel.posterPath}',
            voteAverage: movieModel.voteAverage);
      }).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
