// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Movie extends DataClass implements Insertable<Movie> {
  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final double runTime;
  final bool finished;
  Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      @required this.posterPath,
      @required this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
      @required this.releaseDate,
      this.runTime,
      this.finished});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final stringType = db.typeSystem.forDartType<String>();
    return Movie(
      popularity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      video: boolType.mapFromDatabaseResponse(data['${effectivePrefix}video']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      adult: boolType.mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      originalLanguage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      originalTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      voteAverage: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      runTime: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}run_time']),
      finished:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}finished']),
    );
  }
  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Movie(
      popularity: serializer.fromJson<double>(json['popularity']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      video: serializer.fromJson<bool>(json['video']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String>(json['originalTitle']),
      title: serializer.fromJson<String>(json['title']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      runTime: serializer.fromJson<double>(json['runTime']),
      finished: serializer.fromJson<bool>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'popularity': serializer.toJson<double>(popularity),
      'voteCount': serializer.toJson<int>(voteCount),
      'video': serializer.toJson<bool>(video),
      'posterPath': serializer.toJson<String>(posterPath),
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'title': serializer.toJson<String>(title),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'runTime': serializer.toJson<double>(runTime),
      'finished': serializer.toJson<bool>(finished),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Movie>>(bool nullToAbsent) {
    return MoviesCompanion(
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      video:
          video == null && nullToAbsent ? const Value.absent() : Value(video),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      runTime: runTime == null && nullToAbsent
          ? const Value.absent()
          : Value(runTime),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
    ) as T;
  }

  Movie copyWith(
          {double popularity,
          int voteCount,
          bool video,
          String posterPath,
          int id,
          bool adult,
          String backdropPath,
          String originalLanguage,
          String originalTitle,
          String title,
          double voteAverage,
          String overview,
          String releaseDate,
          double runTime,
          bool finished}) =>
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
  int get hashCode => $mrjf($mrjc(
      popularity.hashCode,
      $mrjc(
          voteCount.hashCode,
          $mrjc(
              video.hashCode,
              $mrjc(
                  posterPath.hashCode,
                  $mrjc(
                      id.hashCode,
                      $mrjc(
                          adult.hashCode,
                          $mrjc(
                              backdropPath.hashCode,
                              $mrjc(
                                  originalLanguage.hashCode,
                                  $mrjc(
                                      originalTitle.hashCode,
                                      $mrjc(
                                          title.hashCode,
                                          $mrjc(
                                              voteAverage.hashCode,
                                              $mrjc(
                                                  overview.hashCode,
                                                  $mrjc(
                                                      releaseDate.hashCode,
                                                      $mrjc(
                                                          runTime.hashCode,
                                                          finished
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Movie &&
          other.popularity == popularity &&
          other.voteCount == voteCount &&
          other.video == video &&
          other.posterPath == posterPath &&
          other.id == id &&
          other.adult == adult &&
          other.backdropPath == backdropPath &&
          other.originalLanguage == originalLanguage &&
          other.originalTitle == originalTitle &&
          other.title == title &&
          other.voteAverage == voteAverage &&
          other.overview == overview &&
          other.releaseDate == releaseDate &&
          other.runTime == runTime &&
          other.finished == finished);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<double> popularity;
  final Value<int> voteCount;
  final Value<bool> video;
  final Value<String> posterPath;
  final Value<int> id;
  final Value<bool> adult;
  final Value<String> backdropPath;
  final Value<String> originalLanguage;
  final Value<String> originalTitle;
  final Value<String> title;
  final Value<double> voteAverage;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<double> runTime;
  final Value<bool> finished;
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
  MoviesCompanion copyWith(
      {Value<double> popularity,
      Value<int> voteCount,
      Value<bool> video,
      Value<String> posterPath,
      Value<int> id,
      Value<bool> adult,
      Value<String> backdropPath,
      Value<String> originalLanguage,
      Value<String> originalTitle,
      Value<String> title,
      Value<double> voteAverage,
      Value<String> overview,
      Value<String> releaseDate,
      Value<double> runTime,
      Value<bool> finished}) {
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
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  GeneratedRealColumn _popularity;
  @override
  GeneratedRealColumn get popularity => _popularity ??= _constructPopularity();
  GeneratedRealColumn _constructPopularity() {
    return GeneratedRealColumn(
      'popularity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _videoMeta = const VerificationMeta('video');
  GeneratedBoolColumn _video;
  @override
  GeneratedBoolColumn get video => _video ??= _constructVideo();
  GeneratedBoolColumn _constructVideo() {
    return GeneratedBoolColumn('video', $tableName, true,
        defaultValue: Constant(false));
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  GeneratedBoolColumn _adult;
  @override
  GeneratedBoolColumn get adult => _adult ??= _constructAdult();
  GeneratedBoolColumn _constructAdult() {
    return GeneratedBoolColumn('adult', $tableName, true,
        defaultValue: Constant(false));
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      true,
    );
  }

  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  GeneratedTextColumn _originalLanguage;
  @override
  GeneratedTextColumn get originalLanguage =>
      _originalLanguage ??= _constructOriginalLanguage();
  GeneratedTextColumn _constructOriginalLanguage() {
    return GeneratedTextColumn(
      'original_language',
      $tableName,
      true,
    );
  }

  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  GeneratedTextColumn _originalTitle;
  @override
  GeneratedTextColumn get originalTitle =>
      _originalTitle ??= _constructOriginalTitle();
  GeneratedTextColumn _constructOriginalTitle() {
    return GeneratedTextColumn(
      'original_title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedRealColumn _voteAverage;
  @override
  GeneratedRealColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();
  GeneratedRealColumn _constructVoteAverage() {
    return GeneratedRealColumn(
      'vote_average',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _runTimeMeta = const VerificationMeta('runTime');
  GeneratedRealColumn _runTime;
  @override
  GeneratedRealColumn get runTime => _runTime ??= _constructRunTime();
  GeneratedRealColumn _constructRunTime() {
    return GeneratedRealColumn(
      'run_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _finishedMeta = const VerificationMeta('finished');
  GeneratedBoolColumn _finished;
  @override
  GeneratedBoolColumn get finished => _finished ??= _constructFinished();
  GeneratedBoolColumn _constructFinished() {
    return GeneratedBoolColumn('finished', $tableName, true,
        defaultValue: Constant(false));
  }

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
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(MoviesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.popularity.present) {
      context.handle(_popularityMeta,
          popularity.isAcceptableValue(d.popularity.value, _popularityMeta));
    } else if (popularity.isRequired && isInserting) {
      context.missing(_popularityMeta);
    }
    if (d.voteCount.present) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableValue(d.voteCount.value, _voteCountMeta));
    } else if (voteCount.isRequired && isInserting) {
      context.missing(_voteCountMeta);
    }
    if (d.video.present) {
      context.handle(
          _videoMeta, video.isAcceptableValue(d.video.value, _videoMeta));
    } else if (video.isRequired && isInserting) {
      context.missing(_videoMeta);
    }
    if (d.posterPath.present) {
      context.handle(_posterPathMeta,
          posterPath.isAcceptableValue(d.posterPath.value, _posterPathMeta));
    } else if (posterPath.isRequired && isInserting) {
      context.missing(_posterPathMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.adult.present) {
      context.handle(
          _adultMeta, adult.isAcceptableValue(d.adult.value, _adultMeta));
    } else if (adult.isRequired && isInserting) {
      context.missing(_adultMeta);
    }
    if (d.backdropPath.present) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableValue(
              d.backdropPath.value, _backdropPathMeta));
    } else if (backdropPath.isRequired && isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (d.originalLanguage.present) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableValue(
              d.originalLanguage.value, _originalLanguageMeta));
    } else if (originalLanguage.isRequired && isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (d.originalTitle.present) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableValue(
              d.originalTitle.value, _originalTitleMeta));
    } else if (originalTitle.isRequired && isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.voteAverage.present) {
      context.handle(_voteAverageMeta,
          voteAverage.isAcceptableValue(d.voteAverage.value, _voteAverageMeta));
    } else if (voteAverage.isRequired && isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (d.overview.present) {
      context.handle(_overviewMeta,
          overview.isAcceptableValue(d.overview.value, _overviewMeta));
    } else if (overview.isRequired && isInserting) {
      context.missing(_overviewMeta);
    }
    if (d.releaseDate.present) {
      context.handle(_releaseDateMeta,
          releaseDate.isAcceptableValue(d.releaseDate.value, _releaseDateMeta));
    } else if (releaseDate.isRequired && isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (d.runTime.present) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableValue(d.runTime.value, _runTimeMeta));
    } else if (runTime.isRequired && isInserting) {
      context.missing(_runTimeMeta);
    }
    if (d.finished.present) {
      context.handle(_finishedMeta,
          finished.isAcceptableValue(d.finished.value, _finishedMeta));
    } else if (finished.isRequired && isInserting) {
      context.missing(_finishedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MoviesCompanion d) {
    final map = <String, Variable>{};
    if (d.popularity.present) {
      map['popularity'] = Variable<double, RealType>(d.popularity.value);
    }
    if (d.voteCount.present) {
      map['vote_count'] = Variable<int, IntType>(d.voteCount.value);
    }
    if (d.video.present) {
      map['video'] = Variable<bool, BoolType>(d.video.value);
    }
    if (d.posterPath.present) {
      map['poster_path'] = Variable<String, StringType>(d.posterPath.value);
    }
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.adult.present) {
      map['adult'] = Variable<bool, BoolType>(d.adult.value);
    }
    if (d.backdropPath.present) {
      map['backdrop_path'] = Variable<String, StringType>(d.backdropPath.value);
    }
    if (d.originalLanguage.present) {
      map['original_language'] =
          Variable<String, StringType>(d.originalLanguage.value);
    }
    if (d.originalTitle.present) {
      map['original_title'] =
          Variable<String, StringType>(d.originalTitle.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.voteAverage.present) {
      map['vote_average'] = Variable<double, RealType>(d.voteAverage.value);
    }
    if (d.overview.present) {
      map['overview'] = Variable<String, StringType>(d.overview.value);
    }
    if (d.releaseDate.present) {
      map['release_date'] = Variable<String, StringType>(d.releaseDate.value);
    }
    if (d.runTime.present) {
      map['run_time'] = Variable<double, RealType>(d.runTime.value);
    }
    if (d.finished.present) {
      map['finished'] = Variable<bool, BoolType>(d.finished.value);
    }
    return map;
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  MovieDao _movieDao;
  MovieDao get movieDao => _movieDao ??= MovieDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [movies];
}
