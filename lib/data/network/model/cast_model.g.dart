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
      'cast_id',
      serializers.serialize(object.castId, specifiedType: const FullType(int)),
      'character',
      serializers.serialize(object.character,
          specifiedType: const FullType(String)),
      'credit_id',
      serializers.serialize(object.creditId,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(int)),
      'profile_path',
      serializers.serialize(object.profilePath,
          specifiedType: const FullType(String)),
    ];

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
      final dynamic value = iterator.current;
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
      (new CastModelBuilder()..update(updates)).build();

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
    if (castId == null) {
      throw new BuiltValueNullFieldError('CastModel', 'castId');
    }
    if (character == null) {
      throw new BuiltValueNullFieldError('CastModel', 'character');
    }
    if (creditId == null) {
      throw new BuiltValueNullFieldError('CastModel', 'creditId');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('CastModel', 'gender');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('CastModel', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CastModel', 'name');
    }
    if (order == null) {
      throw new BuiltValueNullFieldError('CastModel', 'order');
    }
    if (profilePath == null) {
      throw new BuiltValueNullFieldError('CastModel', 'profilePath');
    }
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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, castId.hashCode), character.hashCode),
                            creditId.hashCode),
                        gender.hashCode),
                    id.hashCode),
                name.hashCode),
            order.hashCode),
        profilePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CastModel')
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
    if (_$v != null) {
      _castId = _$v.castId;
      _character = _$v.character;
      _creditId = _$v.creditId;
      _gender = _$v.gender;
      _id = _$v.id;
      _name = _$v.name;
      _order = _$v.order;
      _profilePath = _$v.profilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CastModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CastModel;
  }

  @override
  void update(void Function(CastModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CastModel build() {
    final _$result = _$v ??
        new _$CastModel._(
            castId: castId,
            character: character,
            creditId: creditId,
            gender: gender,
            id: id,
            name: name,
            order: order,
            profilePath: profilePath);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
