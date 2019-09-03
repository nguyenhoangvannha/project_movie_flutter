import 'package:project_movie/data/network/service/movie_api_service.dart';

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
                'https://image.tmdb.org/t/p/w342${movieModel.posterPath}',
            voteAverage: movieModel.voteAverage);
      }).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
