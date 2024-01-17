// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CastModel> _$castModelSerializer = new _$CastModelSerializer();

class _$CastModelSerializer implements StructuredSerializer<CastModel> {
  @override
  final Iterable<Type> types = const [CastModel, _$CastModel];
  @override
  final String wireName = 'CastModel';

  @override
  Iterable<Object> serialize(Serializers serializers, CastModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    Object value;
    value = object.castId;
    if (value != null) {
      result
        ..add('cast_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.character;
    if (value != null) {
      result
        ..add('character')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creditId;
    if (value != null) {
      result
        ..add('credit_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.profilePath;
    if (value != null) {
      result
        ..add('profile_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CastModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CastModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'cast_id':
          result.castId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CastModel extends CastModel {
  @override
  final int castId;
  @override
  final String character;
  @override
  final String creditId;
  @override
  final int gender;
  @override
  final int id;
  @override
  final String name;
  @override
  final int order;
  @override
  final String profilePath;

  factory _$CastModel([void Function(CastModelBuilder) updates]) =>
      (new CastModelBuilder()..update(updates))._build();

  _$CastModel._(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CastModel', 'id');
  }

  @override
  CastModel rebuild(void Function(CastModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CastModelBuilder toBuilder() => new CastModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CastModel &&
        castId == other.castId &&
        character == other.character &&
        creditId == other.creditId &&
        gender == other.gender &&
        id == other.id &&
        name == other.name &&
        order == other.order &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, castId.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jc(_$hash, creditId.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, profilePath.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CastModel')
          ..add('castId', castId)
          ..add('character', character)
          ..add('creditId', creditId)
          ..add('gender', gender)
          ..add('id', id)
          ..add('name', name)
          ..add('order', order)
          ..add('profilePath', profilePath))
        .toString();
  }
}

class CastModelBuilder implements Builder<CastModel, CastModelBuilder> {
  _$CastModel _$v;

  int _castId;
  int get castId => _$this._castId;
  set castId(int castId) => _$this._castId = castId;

  String _character;
  String get character => _$this._character;
  set character(String character) => _$this._character = character;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _order;
  int get order => _$this._order;
  set order(int order) => _$this._order = order;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  CastModelBuilder();

  CastModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _castId = $v.castId;
      _character = $v.character;
      _creditId = $v.creditId;
      _gender = $v.gender;
      _id = $v.id;
      _name = $v.name;
      _order = $v.order;
      _profilePath = $v.profilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CastModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CastModel;
  }

  @override
  void update(void Function(CastModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CastModel build() => _build();

  _$CastModel _build() {
    final _$result = _$v ??
        new _$CastModel._(
            castId: castId,
            character: character,
            creditId: creditId,
            gender: gender,
            id: BuiltValueNullFieldError.checkNotNull(id, r'CastModel', 'id'),
            name: name,
            order: order,
            profilePath: profilePath);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
