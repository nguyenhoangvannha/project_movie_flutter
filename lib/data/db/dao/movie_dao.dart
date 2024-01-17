import 'package:drift/drift.dart';
import 'package:project_movie_flutter/data/db/moor_database.dart';
import 'package:project_movie_flutter/data/db/table/movie_table.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [Movies])
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  AppDatabase db;

  MovieDao(this.db) : super(db);

  Future<List<Movie>> getAllMovies() => select(movies).get();

  Future<int> insertMovie(Insertable<Movie> movie) =>
      into(movies).insert(movie);

  Future<bool> updateMovie(Insertable<Movie> movie) =>
      update(movies).replace(movie);

  Future<int> deleteMovie(int movieId) =>
      (delete(movies)..where((t) => t.id.equals(movieId))).go();
}
