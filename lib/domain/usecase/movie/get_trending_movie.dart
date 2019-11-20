import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/movie.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetTrendingMovie implements UseCase<List<Movie>, MovieParams> {
  final MovieRepository movieRepository;

  GetTrendingMovie(this.movieRepository);

  @override
  Future<DataResource<List<Movie>>> execute(MovieParams params) {
    return movieRepository.getTrendingMovies(page: params.page);
  }
}
