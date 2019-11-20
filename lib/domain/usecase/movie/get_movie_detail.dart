import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/movie.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetMovieDetail implements UseCase<Movie, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieDetail(this.movieRepository);

  @override
  Future<DataResource<Movie>> execute(MovieParams params) {
    return movieRepository.getMovieDetail(params.movieId);
  }

}
