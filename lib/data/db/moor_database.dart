import 'package:moor_flutter/moor_flutter.dart';
import 'package:project_movie_flutter/data/db/table/movie_table.dart';

import 'dao/movie_dao.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Movies], daos: [MovieDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
