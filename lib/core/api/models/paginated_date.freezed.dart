// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedDate _$PaginatedDateFromJson(Map<String, dynamic> json) {
  return _PaginatedDate.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDate {
  @HiveField(0)
  DateTime get maximum => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get minimum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedDateCopyWith<PaginatedDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDateCopyWith<$Res> {
  factory $PaginatedDateCopyWith(
          PaginatedDate value, $Res Function(PaginatedDate) then) =
      _$PaginatedDateCopyWithImpl<$Res>;
  $Res call({@HiveField(0) DateTime maximum, @HiveField(1) DateTime minimum});
}

/// @nodoc
class _$PaginatedDateCopyWithImpl<$Res>
    implements $PaginatedDateCopyWith<$Res> {
  _$PaginatedDateCopyWithImpl(this._value, this._then);

  final PaginatedDate _value;
  // ignore: unused_field
  final $Res Function(PaginatedDate) _then;

  @override
  $Res call({
    Object? maximum = freezed,
    Object? minimum = freezed,
  }) {
    return _then(_value.copyWith(
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_PaginatedDateCopyWith<$Res>
    implements $PaginatedDateCopyWith<$Res> {
  factory _$$_PaginatedDateCopyWith(
          _$_PaginatedDate value, $Res Function(_$_PaginatedDate) then) =
      __$$_PaginatedDateCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) DateTime maximum, @HiveField(1) DateTime minimum});
}

/// @nodoc
class __$$_PaginatedDateCopyWithImpl<$Res>
    extends _$PaginatedDateCopyWithImpl<$Res>
    implements _$$_PaginatedDateCopyWith<$Res> {
  __$$_PaginatedDateCopyWithImpl(
      _$_PaginatedDate _value, $Res Function(_$_PaginatedDate) _then)
      : super(_value, (v) => _then(v as _$_PaginatedDate));

  @override
  _$_PaginatedDate get _value => super._value as _$_PaginatedDate;

  @override
  $Res call({
    Object? maximum = freezed,
    Object? minimum = freezed,
  }) {
    return _then(_$_PaginatedDate(
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 6, adapterName: 'PaginatedDateDataAdapter')
@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PaginatedDate implements _PaginatedDate {
  const _$_PaginatedDate(
      {@HiveField(0) required this.maximum,
      @HiveField(1) required this.minimum});

  factory _$_PaginatedDate.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedDateFromJson(json);

  @override
  @HiveField(0)
  final DateTime maximum;
  @override
  @HiveField(1)
  final DateTime minimum;

  @override
  String toString() {
    return 'PaginatedDate(maximum: $maximum, minimum: $minimum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedDate &&
            const DeepCollectionEquality().equals(other.maximum, maximum) &&
            const DeepCollectionEquality().equals(other.minimum, minimum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maximum),
      const DeepCollectionEquality().hash(minimum));

  @JsonKey(ignore: true)
  @override
  _$$_PaginatedDateCopyWith<_$_PaginatedDate> get copyWith =>
      __$$_PaginatedDateCopyWithImpl<_$_PaginatedDate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedDateToJson(
      this,
    );
  }
}

abstract class _PaginatedDate implements PaginatedDate {
  const factory _PaginatedDate(
      {@HiveField(0) required final DateTime maximum,
      @HiveField(1) required final DateTime minimum}) = _$_PaginatedDate;

  factory _PaginatedDate.fromJson(Map<String, dynamic> json) =
      _$_PaginatedDate.fromJson;

  @override
  @HiveField(0)
  DateTime get maximum;
  @override
  @HiveField(1)
  DateTime get minimum;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedDateCopyWith<_$_PaginatedDate> get copyWith =>
      throw _privateConstructorUsedError;
}
