import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';

part 'paginated_date.freezed.dart';
part 'paginated_date.g.dart';

@freezed
class PaginatedDate extends ResponseObject with _$PaginatedDate {
  @HiveType(typeId: 6, adapterName: 'PaginatedDateDataAdapter')
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory PaginatedDate({
    @HiveField(0) required DateTime maximum,
    @HiveField(1) required DateTime minimum,
  }) = _PaginatedDate;

  factory PaginatedDate.fromJson(Map<String, Object?> json) =>
      _$PaginatedDateFromJson(json);

  static PaginatedDate Function(Map<String, Object?>) get serializer =>
      _$PaginatedDateFromJson;
}
