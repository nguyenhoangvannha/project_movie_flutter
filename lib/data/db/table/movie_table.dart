import 'package:moor_flutter/moor_flutter.dart';

class Movies extends Table {
  RealColumn get popularity => real().nullable()();

  IntColumn get voteCount => integer().nullable()();

  BoolColumn get video => boolean().nullable().withDefault(Constant(false))();

  TextColumn get posterPath => text()();

  IntColumn get id => integer()();

  BoolColumn get adult => boolean().nullable().withDefault(Constant(false))();

  TextColumn get backdropPath => text().nullable()();

  TextColumn get originalLanguage => text().nullable()();

  TextColumn get originalTitle => text().nullable()();

  TextColumn get title => text()();

  RealColumn get voteAverage => real()();

  TextColumn get overview => text()();

  TextColumn get releaseDate => text()();

  RealColumn get runTime => real().nullable()();

  BoolColumn get finished =>
      boolean().nullable().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
