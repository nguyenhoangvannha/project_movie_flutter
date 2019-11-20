import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/cast.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetMovieCredits implements UseCase<List<Cast>, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieCredits(this.movieRepository);

  @override
  Future<DataResource<List<Cast>>> execute(MovieParams params) {
    return movieRepository.getMovieCredits(params.movieId);
  }
}
