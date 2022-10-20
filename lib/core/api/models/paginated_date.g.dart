// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginatedDateDataAdapter extends TypeAdapter<_$_PaginatedDate> {
  @override
  final int typeId = 6;

  @override
  _$_PaginatedDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PaginatedDate(
      maximum: fields[0] as DateTime,
      minimum: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PaginatedDate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maximum)
      ..writeByte(1)
      ..write(obj.minimum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginatedDateDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedDate _$$_PaginatedDateFromJson(Map<String, dynamic> json) =>
    _$_PaginatedDate(
      maximum: DateTime.parse(json['maximum'] as String),
      minimum: DateTime.parse(json['minimum'] as String),
    );

Map<String, dynamic> _$$_PaginatedDateToJson(_$_PaginatedDate instance) =>
    <String, dynamic>{
      'maximum': instance.maximum.toIso8601String(),
      'minimum': instance.minimum.toIso8601String(),
    };
