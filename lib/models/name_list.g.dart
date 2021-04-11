// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NameListAdapter extends TypeAdapter<NameList> {
  @override
  final int typeId = 2;

  @override
  NameList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameList(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as dynamic,
      fields[6] as int,
      fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, NameList obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.menuID)
      ..writeByte(2)
      ..write(obj.languageID)
      ..writeByte(3)
      ..write(obj.localName)
      ..writeByte(4)
      ..write(obj.onlineName)
      ..writeByte(5)
      ..write(obj.shortName)
      ..writeByte(6)
      ..write(obj.orderIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameList _$NameListFromJson(Map<String, dynamic> json) {
  return NameList(
    json['id'] as int,
    json['menuID'] as int,
    json['languageID'] as int,
    json['localName'] as String,
    json['onlineName'],
    json['orderIndex'] as int,
    json['shortName'],
  );
}

Map<String, dynamic> _$NameListToJson(NameList instance) => <String, dynamic>{
      'id': instance.id,
      'menuID': instance.menuID,
      'languageID': instance.languageID,
      'localName': instance.localName,
      'onlineName': instance.onlineName,
      'shortName': instance.shortName,
      'orderIndex': instance.orderIndex,
    };
