// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoResponseModel> _$videoResponseModelSerializer =
    new _$VideoResponseModelSerializer();

class _$VideoResponseModelSerializer
    implements StructuredSerializer<VideoResponseModel> {
  @override
  final Iterable<Type> types = const [VideoResponseModel, _$VideoResponseModel];
  @override
  final String wireName = 'VideoResponseModel';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.videos,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoModel)])),
    ];

    return result;
  }

  @override
  VideoResponseModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoModel)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoResponseModel extends VideoResponseModel {
  @override
  final int id;
  @override
  final BuiltList<VideoModel> videos;

  factory _$VideoResponseModel(
          [void Function(VideoResponseModelBuilder) updates]) =>
      (new VideoResponseModelBuilder()..update(updates)).build();

  _$VideoResponseModel._({this.id, this.videos}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('VideoResponseModel', 'id');
    }
    if (videos == null) {
      throw new BuiltValueNullFieldError('VideoResponseModel', 'videos');
    }
  }

  @override
  VideoResponseModel rebuild(
          void Function(VideoResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoResponseModelBuilder toBuilder() =>
      new VideoResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoResponseModel &&
        id == other.id &&
        videos == other.videos;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), videos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoResponseModel')
          ..add('id', id)
          ..add('videos', videos))
        .toString();
  }
}

class VideoResponseModelBuilder
    implements Builder<VideoResponseModel, VideoResponseModelBuilder> {
  _$VideoResponseModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<VideoModel> _videos;
  ListBuilder<VideoModel> get videos =>
      _$this._videos ??= new ListBuilder<VideoModel>();
  set videos(ListBuilder<VideoModel> videos) => _$this._videos = videos;

  VideoResponseModelBuilder();

  VideoResponseModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _videos = _$v.videos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoResponseModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoResponseModel;
  }

  @override
  void update(void Function(VideoResponseModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoResponseModel build() {
    _$VideoResponseModel _$result;
    try {
      _$result =
          _$v ?? new _$VideoResponseModel._(id: id, videos: videos.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videos';
        videos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
