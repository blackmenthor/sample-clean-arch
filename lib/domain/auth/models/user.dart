import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User extends ResponseObject with _$User {
  @HiveType(typeId: 1, adapterName: 'UserDataAdapter')
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String username,
    @HiveField(2) required String? firstName,
    @HiveField(3) required String? lastName,
    @HiveField(4) required String? access,
    @HiveField(5) required String? refresh,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
  => _$UserFromJson(json);

  static User Function(Map<String, Object?>) get serializer
  => _$UserFromJson;

}
