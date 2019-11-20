import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/movie.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetFavoriteMovies implements UseCase<List<Movie>, MovieParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<DataResource<List<Movie>>> execute(MovieParams params) {
    return movieRepository.getFavoriteMovies(page: params.page);
  }
}
