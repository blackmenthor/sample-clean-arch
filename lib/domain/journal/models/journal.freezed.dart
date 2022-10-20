// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return _Journal.fromJson(json);
}

/// @nodoc
mixin _$Journal {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get body => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get thumbnail => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get deleted => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isFavorite => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String? body,
      @HiveField(3) String? thumbnail,
      @HiveField(4) bool deleted,
      @HiveField(5) bool isFavorite,
      @HiveField(6) DateTime date});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = freezed,
    Object? thumbnail = freezed,
    Object? deleted = null,
    Object? isFavorite = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JournalCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$_JournalCopyWith(
          _$_Journal value, $Res Function(_$_Journal) then) =
      __$$_JournalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String? body,
      @HiveField(3) String? thumbnail,
      @HiveField(4) bool deleted,
      @HiveField(5) bool isFavorite,
      @HiveField(6) DateTime date});
}

/// @nodoc
class __$$_JournalCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$_Journal>
    implements _$$_JournalCopyWith<$Res> {
  __$$_JournalCopyWithImpl(_$_Journal _value, $Res Function(_$_Journal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = freezed,
    Object? thumbnail = freezed,
    Object? deleted = null,
    Object? isFavorite = null,
    Object? date = null,
  }) {
    return _then(_$_Journal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'JournalDataAdapter')
@JsonSerializable(fieldRename: FieldRename.snake)
@CustomDateTimeConverter()
class _$_Journal implements _Journal {
  const _$_Journal(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.body,
      @HiveField(3) required this.thumbnail,
      @HiveField(4) required this.deleted,
      @HiveField(5) required this.isFavorite,
      @HiveField(6) required this.date});

  factory _$_Journal.fromJson(Map<String, dynamic> json) =>
      _$$_JournalFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String? body;
  @override
  @HiveField(3)
  final String? thumbnail;
  @override
  @HiveField(4)
  final bool deleted;
  @override
  @HiveField(5)
  final bool isFavorite;
  @override
  @HiveField(6)
  final DateTime date;

  @override
  String toString() {
    return 'Journal(id: $id, title: $title, body: $body, thumbnail: $thumbnail, deleted: $deleted, isFavorite: $isFavorite, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Journal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, thumbnail, deleted, isFavorite, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalCopyWith<_$_Journal> get copyWith =>
      __$$_JournalCopyWithImpl<_$_Journal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JournalToJson(
      this,
    );
  }
}

abstract class _Journal implements Journal {
  const factory _Journal(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String? body,
      @HiveField(3) required final String? thumbnail,
      @HiveField(4) required final bool deleted,
      @HiveField(5) required final bool isFavorite,
      @HiveField(6) required final DateTime date}) = _$_Journal;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$_Journal.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String? get body;
  @override
  @HiveField(3)
  String? get thumbnail;
  @override
  @HiveField(4)
  bool get deleted;
  @override
  @HiveField(5)
  bool get isFavorite;
  @override
  @HiveField(6)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_JournalCopyWith<_$_Journal> get copyWith =>
      throw _privateConstructorUsedError;
}
