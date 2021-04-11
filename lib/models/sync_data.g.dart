// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncDataAdapter extends TypeAdapter<SyncData> {
  @override
  final int typeId = 40;

  @override
  SyncData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncData(
      id: fields[0] as String,
      action: fields[1] as String,
      data: fields[2] as String,
      isUploaded: fields[3] as bool,
      lastUpdate: fields[4] as DateTime,
      status: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SyncData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.action)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.isUploaded)
      ..writeByte(4)
      ..write(obj.lastUpdate)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncData _$SyncDataFromJson(Map<String, dynamic> json) {
  return SyncData(
    id: json['id'] as String,
    action: json['action'] as String,
    data: json['data'] as String,
    isUploaded: json['isUploaded'] as bool,
    lastUpdate: json['lastUpdate'] == null
        ? null
        : DateTime.parse(json['lastUpdate'] as String),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$SyncDataToJson(SyncData instance) => <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'data': instance.data,
      'isUploaded': instance.isUploaded,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
      'status': instance.status,
    };
