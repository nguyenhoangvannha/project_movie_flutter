import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

class UpdateFavoriteMovie extends UseCase<bool, Movie> {
  final MovieRepository movieRepository;

  UpdateFavoriteMovie(this.movieRepository);

  @override
  Future<DataResource<bool>> execute(Movie movie) {
    return movieRepository.updateFavoriteMovie(movie);
  }
}
