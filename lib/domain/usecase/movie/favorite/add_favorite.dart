import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';
import 'package:project_movie_flutter/domain/usecase/use_case.dart';
import 'package:project_movie_flutter/util/resource.dart';

class AddFavoriteMovie extends UseCase<bool, Movie> {
  final MovieRepository movieRepository;

  AddFavoriteMovie(this.movieRepository);

  @override
  Future<DataResource<bool>> execute(Movie params) {
    return movieRepository.addFavoriteMovie(params);
  }
}
