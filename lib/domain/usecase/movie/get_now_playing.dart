import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/movie.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetNowPlaying implements UseCase<List<Movie>, MovieParams> {
  final MovieRepository movieRepository;

  GetNowPlaying(this.movieRepository);

  @override
  Future<DataResource<List<Movie>>> execute(MovieParams params) {
    return movieRepository.getNowPlaying(page: params.page);
  }
}
