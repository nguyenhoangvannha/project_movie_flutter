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
    if (object.page != null) {
      result..add('page')..add(serializers.serialize(object.page,
          specifiedType: const FullType(int)));
    }
    if (object.totalResults != null) {
      result..add('total_results')..add(
          serializers.serialize(object.totalResults,
              specifiedType: const FullType(int)));
    }
    if (object.totalPages != null) {
      result..add('total_pages')..add(serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)));
    }
    if (object.movies != null) {
      result..add('results')..add(serializers.serialize(object.movies,
          specifiedType:
          const FullType(BuiltList, const [const FullType(MovieModel)])));
    }
    return result;
  }

  @override
  MovieResponseModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
          result.movies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieModel)]))
              as BuiltList<dynamic>);
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
      (new MovieResponseModelBuilder()..update(updates)).build();

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
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), totalResults.hashCode),
            totalPages.hashCode),
        movies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieResponseModel')
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
    if (_$v != null) {
      _page = _$v.page;
      _totalResults = _$v.totalResults;
      _totalPages = _$v.totalPages;
      _movies = _$v.movies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieResponseModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MovieResponseModel;
  }

  @override
  void update(void Function(MovieResponseModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieResponseModel build() {
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
            'MovieResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
