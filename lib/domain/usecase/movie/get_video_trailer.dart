import 'package:project_movie_flutter/domain/usecase/movie/movie_params.dart';
import 'package:project_movie_flutter/util/resource.dart';

import '../../entity/video.dart';
import '../../repository/movie_repository.dart';
import '../use_case.dart';

class GetVideoTrailer implements UseCase<List<Video>, MovieParams> {
  final MovieRepository movieRepository;

  GetVideoTrailer(this.movieRepository);

  @override
  Future<DataResource<List<Video>>> execute(MovieParams params) {
    return movieRepository.getVideoTrailer(params.movieId);
  }
}
