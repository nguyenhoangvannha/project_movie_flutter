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
  Iterable<Object?> serialize(
      Serializers serializers, VideoResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videos;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(VideoModel)])));
    }
    return result;
  }

  @override
  VideoResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'results':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoResponseModel extends VideoResponseModel {
  @override
  final int? id;
  @override
  final BuiltList<VideoModel>? videos;

  factory _$VideoResponseModel(
          [void Function(VideoResponseModelBuilder)? updates]) =>
      (new VideoResponseModelBuilder()..update(updates))._build();

  _$VideoResponseModel._({this.id, this.videos}) : super._();

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, videos.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoResponseModel')
          ..add('id', id)
          ..add('videos', videos))
        .toString();
  }
}

class VideoResponseModelBuilder
    implements Builder<VideoResponseModel, VideoResponseModelBuilder> {
  _$VideoResponseModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<VideoModel>? _videos;
  ListBuilder<VideoModel> get videos =>
      _$this._videos ??= new ListBuilder<VideoModel>();
  set videos(ListBuilder<VideoModel>? videos) => _$this._videos = videos;

  VideoResponseModelBuilder();

  VideoResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _videos = $v.videos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VideoResponseModel;
  }

  @override
  void update(void Function(VideoResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoResponseModel build() => _build();

  _$VideoResponseModel _build() {
    _$VideoResponseModel _$result;
    try {
      _$result =
          _$v ?? new _$VideoResponseModel._(id: id, videos: _videos?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'videos';
        _videos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VideoResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
