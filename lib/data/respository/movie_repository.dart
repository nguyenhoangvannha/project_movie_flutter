import 'package:project_movie/data/network/service/trending_api_service.dart';

import 'entity/movie.dart';

class MovieRepository {
  final TrendingApiService trendingApiService;

  MovieRepository(this.trendingApiService);

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final data = await trendingApiService.getTrendingMovies();
      return data.body.movies.map((movieModel) {
        return Movie(
            id: movieModel.id,
            title: movieModel.title,
            overview: movieModel.overview,
            posterPath:
                'https://image.tmdb.org/t/p/w342${movieModel.posterPath}',
            voteAverage: movieModel.voteAverage);
      }).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
