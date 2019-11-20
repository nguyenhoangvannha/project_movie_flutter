import 'package:project_movie_flutter/domain/repository/movie_repository.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

class RemoveFavoriteMovie extends UseCase<bool, int> {
  final MovieRepository movieRepository;

  RemoveFavoriteMovie(this.movieRepository);

  @override
  Future<DataResource<bool>> execute(int movieId) {
    return movieRepository.removeFavoriteMovie(movieId);
  }
}
