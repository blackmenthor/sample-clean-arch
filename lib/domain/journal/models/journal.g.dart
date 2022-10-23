// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalDataAdapter extends TypeAdapter<_$_Journal> {
  @override
  final int typeId = 0;

  @override
  _$_Journal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Journal(
      id: fields[0] as String,
      title: fields[1] as String,
      body: fields[2] as String?,
      thumbnail: fields[3] as String?,
      deleted: fields[4] as bool,
      isFavorite: fields[5] as bool,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Journal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.deleted)
      ..writeByte(5)
      ..write(obj.isFavorite)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Journal _$$_JournalFromJson(Map<String, dynamic> json) => _$_Journal(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      thumbnail: json['thumbnail'] as String?,
      deleted: json['deleted'] as bool,
      isFavorite: json['is_favorite'] as bool,
      date: _$JsonConverterFromJson<String, DateTime>(
          json['date'], const CustomDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_JournalToJson(_$_Journal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'thumbnail': instance.thumbnail,
      'deleted': instance.deleted,
      'is_favorite': instance.isFavorite,
      'date': _$JsonConverterToJson<String, DateTime>(
          instance.date, const CustomDateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
