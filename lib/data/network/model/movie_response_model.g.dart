// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieResponseModel> _$movieResponseModelSerializer =
    new _$MovieResponseModelSerializer();

class _$MovieResponseModelSerializer
    implements StructuredSerializer<MovieResponseModel> {
  @override
  final Iterable<Type> types = const [MovieResponseModel, _$MovieResponseModel];
  @override
  final String wireName = 'MovieResponseModel';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalResults;
    if (value != null) {
      result
        ..add('total_results')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPages;
    if (value != null) {
      result
        ..add('total_pages')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movies;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieModel)])));
    }
    return result;
  }

  @override
  MovieResponseModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    T $cast<T>(dynamic any) => any as T;

    final result = new MovieResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          var maybeBuilder = result.movies;
          var fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieModel)]))
              as BuiltList<MovieModel>;
          if (maybeBuilder == null) {
            result.movies = $cast(fieldValue.toBuilder());
          } else {
            maybeBuilder.replace(fieldValue);
          }
          break;
      }
    }

    return result.build();
  }
}

class _$MovieResponseModel extends MovieResponseModel {
  @override
  final int page;
  @override
  final int totalResults;
  @override
  final int totalPages;
  @override
  final BuiltList<MovieModel> movies;

  factory _$MovieResponseModel(
          [void Function(MovieResponseModelBuilder) updates]) =>
      (new MovieResponseModelBuilder()..update(updates))._build();

  _$MovieResponseModel._(
      {this.page, this.totalResults, this.totalPages, this.movies})
      : super._();

  @override
  MovieResponseModel rebuild(
          void Function(MovieResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieResponseModelBuilder toBuilder() =>
      new MovieResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieResponseModel &&
        page == other.page &&
        totalResults == other.totalResults &&
        totalPages == other.totalPages &&
        movies == other.movies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, totalResults.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, movies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MovieResponseModel')
          ..add('page', page)
          ..add('totalResults', totalResults)
          ..add('totalPages', totalPages)
          ..add('movies', movies))
        .toString();
  }
}

class MovieResponseModelBuilder
    implements Builder<MovieResponseModel, MovieResponseModelBuilder> {
  _$MovieResponseModel _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  ListBuilder<MovieModel> _movies;
  ListBuilder<MovieModel> get movies =>
      _$this._movies ??= new ListBuilder<MovieModel>();
  set movies(ListBuilder<MovieModel> movies) => _$this._movies = movies;

  MovieResponseModelBuilder();

  MovieResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _totalResults = $v.totalResults;
      _totalPages = $v.totalPages;
      _movies = $v.movies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieResponseModel;
  }

  @override
  void update(void Function(MovieResponseModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  MovieResponseModel build() => _build();

  _$MovieResponseModel _build() {
    _$MovieResponseModel _$result;
    try {
      _$result = _$v ??
          new _$MovieResponseModel._(
              page: page,
              totalResults: totalResults,
              totalPages: totalPages,
              movies: _movies?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'movies';
        _movies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MovieResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
