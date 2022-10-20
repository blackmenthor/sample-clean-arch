import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:flutter_clean_arch/core/converters/date_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
class Journal extends ResponseObject with _$Journal {
  @HiveType(typeId: 0, adapterName: 'JournalDataAdapter')
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  @CustomDateTimeConverter()
  const factory Journal({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String? body,
    @HiveField(3) required String? thumbnail,
    @HiveField(4) required bool deleted,
    @HiveField(5) required bool isFavorite,
    @HiveField(6) required DateTime date,
  }) = _Journal;

  factory Journal.fromJson(Map<String, Object?> json)
  => _$JournalFromJson(json);

  static Journal Function(Map<String, Object?>) get serializer
  => _$JournalFromJson;

}
