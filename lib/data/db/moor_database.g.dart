// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Movie extends DataClass implements Insertable<Movie> {
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final String posterPath;
  final int id;
  final bool? adult;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalTitle;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final double? runTime;
  final bool? finished;
  Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      required this.posterPath,
      required this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      this.runTime,
      this.finished});
  factory Movie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      video: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video']),
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      adult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      originalLanguage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      originalTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
      runTime: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}run_time']),
      finished: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}finished']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double?>(popularity);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int?>(voteCount);
    }
    if (!nullToAbsent || video != null) {
      map['video'] = Variable<bool?>(video);
    }
    map['poster_path'] = Variable<String>(posterPath);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool?>(adult);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String?>(backdropPath);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String?>(originalLanguage);
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String?>(originalTitle);
    }
    map['title'] = Variable<String>(title);
    map['vote_average'] = Variable<double>(voteAverage);
    map['overview'] = Variable<String>(overview);
    map['release_date'] = Variable<String>(releaseDate);
    if (!nullToAbsent || runTime != null) {
      map['run_time'] = Variable<double?>(runTime);
    }
    if (!nullToAbsent || finished != null) {
      map['finished'] = Variable<bool?>(finished);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      video:
          video == null && nullToAbsent ? const Value.absent() : Value(video),
      posterPath: Value(posterPath),
      id: Value(id),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      title: Value(title),
      voteAverage: Value(voteAverage),
      overview: Value(overview),
      releaseDate: Value(releaseDate),
      runTime: runTime == null && nullToAbsent
          ? const Value.absent()
          : Value(runTime),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      popularity: serializer.fromJson<double?>(json['popularity']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      video: serializer.fromJson<bool?>(json['video']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool?>(json['adult']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      title: serializer.fromJson<String>(json['title']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      runTime: serializer.fromJson<double?>(json['runTime']),
      finished: serializer.fromJson<bool?>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'popularity': serializer.toJson<double?>(popularity),
      'voteCount': serializer.toJson<int?>(voteCount),
      'video': serializer.toJson<bool?>(video),
      'posterPath': serializer.toJson<String>(posterPath),
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool?>(adult),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'title': serializer.toJson<String>(title),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'runTime': serializer.toJson<double?>(runTime),
      'finished': serializer.toJson<bool?>(finished),
    };
  }

  Movie copyWith(
          {double? popularity,
          int? voteCount,
          bool? video,
          String? posterPath,
          int? id,
          bool? adult,
          String? backdropPath,
          String? originalLanguage,
          String? originalTitle,
          String? title,
          double? voteAverage,
          String? overview,
          String? releaseDate,
          double? runTime,
          bool? finished}) =>
      Movie(
        popularity: popularity ?? this.popularity,
        voteCount: voteCount ?? this.voteCount,
        video: video ?? this.video,
        posterPath: posterPath ?? this.posterPath,
        id: id ?? this.id,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        runTime: runTime ?? this.runTime,
        finished: finished ?? this.finished,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('popularity: $popularity, ')
          ..write('voteCount: $voteCount, ')
          ..write('video: $video, ')
          ..write('posterPath: $posterPath, ')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('runTime: $runTime, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      popularity,
      voteCount,
      video,
      posterPath,
      id,
      adult,
      backdropPath,
      originalLanguage,
      originalTitle,
      title,
      voteAverage,
      overview,
      releaseDate,
      runTime,
      finished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.popularity == this.popularity &&
          other.voteCount == this.voteCount &&
          other.video == this.video &&
          other.posterPath == this.posterPath &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.originalLanguage == this.originalLanguage &&
          other.originalTitle == this.originalTitle &&
          other.title == this.title &&
          other.voteAverage == this.voteAverage &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.runTime == this.runTime &&
          other.finished == this.finished);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<double?> popularity;
  final Value<int?> voteCount;
  final Value<bool?> video;
  final Value<String> posterPath;
  final Value<int> id;
  final Value<bool?> adult;
  final Value<String?> backdropPath;
  final Value<String?> originalLanguage;
  final Value<String?> originalTitle;
  final Value<String> title;
  final Value<double> voteAverage;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<double?> runTime;
  final Value<bool?> finished;
  const MoviesCompanion({
    this.popularity = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.video = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.title = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.runTime = const Value.absent(),
    this.finished = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.popularity = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.video = const Value.absent(),
    required String posterPath,
    required int id,
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    required String title,
    required double voteAverage,
    required String overview,
    required String releaseDate,
    this.runTime = const Value.absent(),
    this.finished = const Value.absent(),
  })  : posterPath = Value(posterPath),
        id = Value(id),
        title = Value(title),
        voteAverage = Value(voteAverage),
        overview = Value(overview),
        releaseDate = Value(releaseDate);
  static Insertable<Movie> custom({
    Expression<double?>? popularity,
    Expression<int?>? voteCount,
    Expression<bool?>? video,
    Expression<String>? posterPath,
    Expression<int>? id,
    Expression<bool?>? adult,
    Expression<String?>? backdropPath,
    Expression<String?>? originalLanguage,
    Expression<String?>? originalTitle,
    Expression<String>? title,
    Expression<double>? voteAverage,
    Expression<String>? overview,
    Expression<String>? releaseDate,
    Expression<double?>? runTime,
    Expression<bool?>? finished,
  }) {
    return RawValuesInsertable({
      if (popularity != null) 'popularity': popularity,
      if (voteCount != null) 'vote_count': voteCount,
      if (video != null) 'video': video,
      if (posterPath != null) 'poster_path': posterPath,
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalTitle != null) 'original_title': originalTitle,
      if (title != null) 'title': title,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (runTime != null) 'run_time': runTime,
      if (finished != null) 'finished': finished,
    });
  }

  MoviesCompanion copyWith(
      {Value<double?>? popularity,
      Value<int?>? voteCount,
      Value<bool?>? video,
      Value<String>? posterPath,
      Value<int>? id,
      Value<bool?>? adult,
      Value<String?>? backdropPath,
      Value<String?>? originalLanguage,
      Value<String?>? originalTitle,
      Value<String>? title,
      Value<double>? voteAverage,
      Value<String>? overview,
      Value<String>? releaseDate,
      Value<double?>? runTime,
      Value<bool?>? finished}) {
    return MoviesCompanion(
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      posterPath: posterPath ?? this.posterPath,
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      runTime: runTime ?? this.runTime,
      finished: finished ?? this.finished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (popularity.present) {
      map['popularity'] = Variable<double?>(popularity.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int?>(voteCount.value);
    }
    if (video.present) {
      map['video'] = Variable<bool?>(video.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool?>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String?>(backdropPath.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String?>(originalLanguage.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String?>(originalTitle.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (runTime.present) {
      map['run_time'] = Variable<double?>(runTime.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool?>(finished.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('popularity: $popularity, ')
          ..write('voteCount: $voteCount, ')
          ..write('video: $video, ')
          ..write('posterPath: $posterPath, ')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('runTime: $runTime, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  @override
  late final GeneratedColumn<int?> voteCount = GeneratedColumn<int?>(
      'vote_count', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedColumn<bool?> video = GeneratedColumn<bool?>(
      'video', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (video IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool?> adult = GeneratedColumn<bool?>(
      'adult', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (adult IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String?> backdropPath = GeneratedColumn<String?>(
      'backdrop_path', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String?> originalLanguage =
      GeneratedColumn<String?>('original_language', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String?> originalTitle = GeneratedColumn<String?>(
      'original_title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _runTimeMeta = const VerificationMeta('runTime');
  @override
  late final GeneratedColumn<double?> runTime = GeneratedColumn<double?>(
      'run_time', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _finishedMeta = const VerificationMeta('finished');
  @override
  late final GeneratedColumn<bool?> finished = GeneratedColumn<bool?>(
      'finished', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (finished IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        popularity,
        voteCount,
        video,
        posterPath,
        id,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        title,
        voteAverage,
        overview,
        releaseDate,
        runTime,
        finished
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    }
    if (data.containsKey('video')) {
      context.handle(
          _videoMeta, video.isAcceptableOrUnknown(data['video']!, _videoMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('run_time')) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableOrUnknown(data['run_time']!, _runTimeMeta));
    }
    if (data.containsKey('finished')) {
      context.handle(_finishedMeta,
          finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final MovieDao movieDao = MovieDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}
