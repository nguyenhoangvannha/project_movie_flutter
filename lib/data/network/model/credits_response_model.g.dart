// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreditsResponseModel> _$creditsResponseModelSerializer =
    new _$CreditsResponseModelSerializer();

class _$CreditsResponseModelSerializer
    implements StructuredSerializer<CreditsResponseModel> {
  @override
  final Iterable<Type> types = const [
    CreditsResponseModel,
    _$CreditsResponseModel
  ];
  @override
  final String wireName = 'CreditsResponseModel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CreditsResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'cast',
      serializers.serialize(object.casts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CastModel)])),
    ];

    return result;
  }

  @override
  CreditsResponseModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreditsResponseModelBuilder();

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
        case 'cast':
          result.casts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CastModel)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$CreditsResponseModel extends CreditsResponseModel {
  @override
  final int id;
  @override
  final BuiltList<CastModel> casts;

  factory _$CreditsResponseModel(
          [void Function(CreditsResponseModelBuilder) updates]) =>
      (new CreditsResponseModelBuilder()..update(updates)).build();

  _$CreditsResponseModel._({this.id, this.casts}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CreditsResponseModel', 'id');
    }
    if (casts == null) {
      throw new BuiltValueNullFieldError('CreditsResponseModel', 'casts');
    }
  }

  @override
  CreditsResponseModel rebuild(
          void Function(CreditsResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreditsResponseModelBuilder toBuilder() =>
      new CreditsResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreditsResponseModel &&
        id == other.id &&
        casts == other.casts;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), casts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreditsResponseModel')
          ..add('id', id)
          ..add('casts', casts))
        .toString();
  }
}

class CreditsResponseModelBuilder
    implements Builder<CreditsResponseModel, CreditsResponseModelBuilder> {
  _$CreditsResponseModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<CastModel> _casts;
  ListBuilder<CastModel> get casts =>
      _$this._casts ??= new ListBuilder<CastModel>();
  set casts(ListBuilder<CastModel> casts) => _$this._casts = casts;

  CreditsResponseModelBuilder();

  CreditsResponseModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _casts = _$v.casts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreditsResponseModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreditsResponseModel;
  }

  @override
  void update(void Function(CreditsResponseModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreditsResponseModel build() {
    _$CreditsResponseModel _$result;
    try {
      _$result =
          _$v ?? new _$CreditsResponseModel._(id: id, casts: casts.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'casts';
        casts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreditsResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
