import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:drift/drift.dart';
import 'package:project_movie_flutter/data/db/table/movie_table.dart';

import 'dao/movie_dao.dart';

part 'moor_database.g.dart';

@DriftDatabase(tables: [Movies], daos: [MovieDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((SqfliteQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
