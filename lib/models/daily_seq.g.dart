// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_seq.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailySeqAdapter extends TypeAdapter<DailySeq> {
  @override
  final int typeId = 39;

  @override
  DailySeq read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailySeq(
      id: fields[0] as int,
      seqNum: fields[1] as int,
      orderType: fields[2] as int,
      lastUpdate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, DailySeq obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.seqNum)
      ..writeByte(2)
      ..write(obj.orderType)
      ..writeByte(3)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailySeqAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySeq _$DailySeqFromJson(Map<String, dynamic> json) {
  return DailySeq(
    id: json['id'] as int,
    seqNum: json['seqNum'] as int,
    orderType: json['orderType'] as int,
    lastUpdate: json['lastUpdate'] == null
        ? null
        : DateTime.parse(json['lastUpdate'] as String),
  );
}

Map<String, dynamic> _$DailySeqToJson(DailySeq instance) => <String, dynamic>{
      'id': instance.id,
      'seqNum': instance.seqNum,
      'orderType': instance.orderType,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
    };
