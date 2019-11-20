import 'package:injector/injector.dart';
import 'package:project_movie_flutter/data/db/dao/movie_dao.dart';
import 'package:project_movie_flutter/data/db/moor_database.dart';
import 'package:project_movie_flutter/data/network/service/movie_api_service.dart';
import 'package:project_movie_flutter/data/respository/movie_repository_impl.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';

class AppInjector {
  static void init() {
    Injector.appInstance.registerSingleton<AppDatabase>((injector) {
      return AppDatabase();
    });

    Injector.appInstance.registerSingleton<MovieDao>((injector) {
      return MovieDao(injector.getDependency());
    });

    Injector.appInstance.registerSingleton<MovieApiService>((injector) {
      return MovieApiService.create();
    });

    Injector.appInstance.registerSingleton<MovieRepository>((injector) {
      return MovieRepositoryImpl(
          movieApiService: injector.getDependency(),
          movieDao: injector.getDependency());
    });

  }
}