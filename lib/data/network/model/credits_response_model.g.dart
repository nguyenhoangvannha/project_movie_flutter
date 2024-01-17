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
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.casts;
    if (value != null) {
      result
        ..add('cast')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(CastModel)])));
    }
    return result;
  }

  @override
  CreditsResponseModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    T $cast<T>(dynamic any) => any as T;

    final result = new CreditsResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cast':
          var maybeBuilder = result.casts;
          var fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CastModel)]))
              as BuiltList<CastModel>;
          if (maybeBuilder == null) {
            result.casts = $cast(fieldValue.toBuilder());
          } else {
            maybeBuilder.replace(fieldValue);
          }
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
      (new CreditsResponseModelBuilder()..update(updates))._build();

  _$CreditsResponseModel._({this.id, this.casts}) : super._();

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, casts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreditsResponseModel')
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
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _casts = $v.casts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreditsResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreditsResponseModel;
  }

  @override
  void update(void Function(CreditsResponseModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CreditsResponseModel build() => _build();

  _$CreditsResponseModel _build() {
    _$CreditsResponseModel _$result;
    try {
      _$result =
          _$v ?? new _$CreditsResponseModel._(id: id, casts: _casts?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'casts';
        _casts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreditsResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
