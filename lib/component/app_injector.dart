import 'package:injector/injector.dart';
import 'package:project_movie_flutter/data/db/dao/movie_dao.dart';
import 'package:project_movie_flutter/data/db/moor_database.dart';
import 'package:project_movie_flutter/data/network/service/movie_api_service.dart';
import 'package:project_movie_flutter/data/respository/movie_repository_impl.dart';
import 'package:project_movie_flutter/domain/repository/movie_repository.dart';

class AppInjector {
  static void init() {
    Injector.appInstance.registerSingleton<AppDatabase>(() {
      return AppDatabase();
    });
    Injector.appInstance.registerSingleton<MovieDao>(() {
      return MovieDao(Injector.appInstance.get());
    });

    Injector.appInstance.registerSingleton<MovieApiService>(() {
      return MovieApiService.create();
    });

    Injector.appInstance.registerSingleton<MovieRepository>(() {
      return MovieRepositoryImpl(
          movieApiService: Injector.appInstance.get(),
          movieDao: Injector.appInstance.get());
    });
  }
}
