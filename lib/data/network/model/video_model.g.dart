// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoModel> _$videoModelSerializer = new _$VideoModelSerializer();

class _$VideoModelSerializer implements StructuredSerializer<VideoModel> {
  @override
  final Iterable<Type> types = const [VideoModel, _$VideoModel];
  @override
  final String wireName = 'VideoModel';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.iso6391;
    if (value != null) {
      result
        ..add('iso_639_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iso31661;
    if (value != null) {
      result
        ..add('iso_3166_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.site;
    if (value != null) {
      result
        ..add('site')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VideoModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iso_639_1':
          result.iso6391 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iso_3166_1':
          result.iso31661 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoModel extends VideoModel {
  @override
  final String id;
  @override
  final String iso6391;
  @override
  final String iso31661;
  @override
  final String key;
  @override
  final String name;
  @override
  final String site;
  @override
  final int size;
  @override
  final String type;

  factory _$VideoModel([void Function(VideoModelBuilder) updates]) =>
      (new VideoModelBuilder()..update(updates))._build();

  _$VideoModel._(
      {this.id,
      this.iso6391,
      this.iso31661,
      this.key,
      this.name,
      this.site,
      this.size,
      this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'VideoModel', 'id');
  }

  @override
  VideoModel rebuild(void Function(VideoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoModelBuilder toBuilder() => new VideoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoModel &&
        id == other.id &&
        iso6391 == other.iso6391 &&
        iso31661 == other.iso31661 &&
        key == other.key &&
        name == other.name &&
        site == other.site &&
        size == other.size &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, iso6391.hashCode);
    _$hash = $jc(_$hash, iso31661.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, site.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoModel')
          ..add('id', id)
          ..add('iso6391', iso6391)
          ..add('iso31661', iso31661)
          ..add('key', key)
          ..add('name', name)
          ..add('site', site)
          ..add('size', size)
          ..add('type', type))
        .toString();
  }
}

class VideoModelBuilder implements Builder<VideoModel, VideoModelBuilder> {
  _$VideoModel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _iso6391;
  String get iso6391 => _$this._iso6391;
  set iso6391(String iso6391) => _$this._iso6391 = iso6391;

  String _iso31661;
  String get iso31661 => _$this._iso31661;
  set iso31661(String iso31661) => _$this._iso31661 = iso31661;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _site;
  String get site => _$this._site;
  set site(String site) => _$this._site = site;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  VideoModelBuilder();

  VideoModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _iso6391 = $v.iso6391;
      _iso31661 = $v.iso31661;
      _key = $v.key;
      _name = $v.name;
      _site = $v.site;
      _size = $v.size;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VideoModel;
  }

  @override
  void update(void Function(VideoModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoModel build() => _build();

  _$VideoModel _build() {
    final _$result = _$v ??
        new _$VideoModel._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'VideoModel', 'id'),
            iso6391: iso6391,
            iso31661: iso31661,
            key: key,
            name: name,
            site: site,
            size: size,
            type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
