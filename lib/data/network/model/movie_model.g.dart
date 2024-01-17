// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieModel> _$movieModelSerializer = new _$MovieModelSerializer();

class _$MovieModelSerializer implements StructuredSerializer<MovieModel> {
  @override
  final Iterable<Type> types = const [MovieModel, _$MovieModel];
  @override
  final String wireName = 'MovieModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MovieModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'release_date',
      serializers.serialize(object.releaseDate,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.voteCount;
    if (value != null) {
      result
        ..add('vote_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adult;
    if (value != null) {
      result
        ..add('adult')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.backdropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalLanguage;
    if (value != null) {
      result
        ..add('original_language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalTitle;
    if (value != null) {
      result
        ..add('original_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genreIds;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.voteAverage;
    if (value != null) {
      result
        ..add('vote_average')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.runTime;
    if (value != null) {
      result
        ..add('runtime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  MovieModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'runtime':
          result.runTime = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieModel extends MovieModel {
  @override
  final double? popularity;
  @override
  final int? voteCount;
  @override
  final bool? video;
  @override
  final String? posterPath;
  @override
  final int id;
  @override
  final bool? adult;
  @override
  final String? backdropPath;
  @override
  final String? originalLanguage;
  @override
  final String? originalTitle;
  @override
  final BuiltList<int>? genreIds;
  @override
  final String? title;
  @override
  final double? voteAverage;
  @override
  final String? overview;
  @override
  final String releaseDate;
  @override
  final double? runTime;

  factory _$MovieModel([void Function(MovieModelBuilder)? updates]) =>
      (new MovieModelBuilder()..update(updates))._build();

  _$MovieModel._(
      {this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      required this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      required this.releaseDate,
      this.runTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MovieModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        releaseDate, r'MovieModel', 'releaseDate');
  }

  @override
  MovieModel rebuild(void Function(MovieModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieModelBuilder toBuilder() => new MovieModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieModel &&
        popularity == other.popularity &&
        voteCount == other.voteCount &&
        video == other.video &&
        posterPath == other.posterPath &&
        id == other.id &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        genreIds == other.genreIds &&
        title == other.title &&
        voteAverage == other.voteAverage &&
        overview == other.overview &&
        releaseDate == other.releaseDate &&
        runTime == other.runTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, popularity.hashCode);
    _$hash = $jc(_$hash, voteCount.hashCode);
    _$hash = $jc(_$hash, video.hashCode);
    _$hash = $jc(_$hash, posterPath.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, adult.hashCode);
    _$hash = $jc(_$hash, backdropPath.hashCode);
    _$hash = $jc(_$hash, originalLanguage.hashCode);
    _$hash = $jc(_$hash, originalTitle.hashCode);
    _$hash = $jc(_$hash, genreIds.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, voteAverage.hashCode);
    _$hash = $jc(_$hash, overview.hashCode);
    _$hash = $jc(_$hash, releaseDate.hashCode);
    _$hash = $jc(_$hash, runTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MovieModel')
          ..add('popularity', popularity)
          ..add('voteCount', voteCount)
          ..add('video', video)
          ..add('posterPath', posterPath)
          ..add('id', id)
          ..add('adult', adult)
          ..add('backdropPath', backdropPath)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('genreIds', genreIds)
          ..add('title', title)
          ..add('voteAverage', voteAverage)
          ..add('overview', overview)
          ..add('releaseDate', releaseDate)
          ..add('runTime', runTime))
        .toString();
  }
}

class MovieModelBuilder implements Builder<MovieModel, MovieModelBuilder> {
  _$MovieModel? _$v;

  double? _popularity;
  double? get popularity => _$this._popularity;
  set popularity(double? popularity) => _$this._popularity = popularity;

  int? _voteCount;
  int? get voteCount => _$this._voteCount;
  set voteCount(int? voteCount) => _$this._voteCount = voteCount;

  bool? _video;
  bool? get video => _$this._video;
  set video(bool? video) => _$this._video = video;

  String? _posterPath;
  String? get posterPath => _$this._posterPath;
  set posterPath(String? posterPath) => _$this._posterPath = posterPath;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _adult;
  bool? get adult => _$this._adult;
  set adult(bool? adult) => _$this._adult = adult;

  String? _backdropPath;
  String? get backdropPath => _$this._backdropPath;
  set backdropPath(String? backdropPath) => _$this._backdropPath = backdropPath;

  String? _originalLanguage;
  String? get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String? _originalTitle;
  String? get originalTitle => _$this._originalTitle;
  set originalTitle(String? originalTitle) =>
      _$this._originalTitle = originalTitle;

  ListBuilder<int>? _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int>? genreIds) => _$this._genreIds = genreIds;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  double? _voteAverage;
  double? get voteAverage => _$this._voteAverage;
  set voteAverage(double? voteAverage) => _$this._voteAverage = voteAverage;

  String? _overview;
  String? get overview => _$this._overview;
  set overview(String? overview) => _$this._overview = overview;

  String? _releaseDate;
  String? get releaseDate => _$this._releaseDate;
  set releaseDate(String? releaseDate) => _$this._releaseDate = releaseDate;

  double? _runTime;
  double? get runTime => _$this._runTime;
  set runTime(double? runTime) => _$this._runTime = runTime;

  MovieModelBuilder();

  MovieModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _popularity = $v.popularity;
      _voteCount = $v.voteCount;
      _video = $v.video;
      _posterPath = $v.posterPath;
      _id = $v.id;
      _adult = $v.adult;
      _backdropPath = $v.backdropPath;
      _originalLanguage = $v.originalLanguage;
      _originalTitle = $v.originalTitle;
      _genreIds = $v.genreIds?.toBuilder();
      _title = $v.title;
      _voteAverage = $v.voteAverage;
      _overview = $v.overview;
      _releaseDate = $v.releaseDate;
      _runTime = $v.runTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieModel;
  }

  @override
  void update(void Function(MovieModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MovieModel build() => _build();

  _$MovieModel _build() {
    _$MovieModel _$result;
    try {
      _$result = _$v ??
          new _$MovieModel._(
              popularity: popularity,
              voteCount: voteCount,
              video: video,
              posterPath: posterPath,
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'MovieModel', 'id'),
              adult: adult,
              backdropPath: backdropPath,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              genreIds: _genreIds?.build(),
              title: title,
              voteAverage: voteAverage,
              overview: overview,
              releaseDate: BuiltValueNullFieldError.checkNotNull(
                  releaseDate, r'MovieModel', 'releaseDate'),
              runTime: runTime);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MovieModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
