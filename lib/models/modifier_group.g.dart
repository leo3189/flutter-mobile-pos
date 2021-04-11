// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModifierGroupAdapter extends TypeAdapter<ModifierGroup> {
  @override
  final int typeId = 13;

  @override
  ModifierGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModifierGroup(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as int,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as String,
      fields[9] as bool,
      fields[10] as bool,
      fields[11] as bool,
      fields[12] as int,
      fields[13] as String,
      fields[14] as String,
      fields[15] as bool,
      fields[16] as bool,
      fields[17] as bool,
      (fields[18] as List)?.cast<NameList>(),
      (fields[19] as List)?.cast<ModifierItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModifierGroup obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.branchId)
      ..writeByte(3)
      ..write(obj.companyID)
      ..writeByte(4)
      ..write(obj.mixSelections)
      ..writeByte(5)
      ..write(obj.maxSelections)
      ..writeByte(6)
      ..write(obj.icon)
      ..writeByte(7)
      ..write(obj.isDisplayAmt)
      ..writeByte(8)
      ..write(obj.unicode)
      ..writeByte(9)
      ..write(obj.isDeleted)
      ..writeByte(10)
      ..write(obj.isParent)
      ..writeByte(11)
      ..write(obj.isActicve)
      ..writeByte(12)
      ..write(obj.orderIndex)
      ..writeByte(13)
      ..write(obj.type)
      ..writeByte(14)
      ..write(obj.color)
      ..writeByte(15)
      ..write(obj.isRequired)
      ..writeByte(16)
      ..write(obj.isSelfOrder)
      ..writeByte(17)
      ..write(obj.isOnlineOrder)
      ..writeByte(18)
      ..write(obj.nameList)
      ..writeByte(19)
      ..write(obj.modifierItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModifierGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifierGroup _$ModifierGroupFromJson(Map<String, dynamic> json) {
  return ModifierGroup(
    json['id'] as int,
    json['parentId'] as int,
    json['branchId'] as String,
    json['companyID'] as String,
    json['mixSelections'] as int,
    json['maxSelections'] as int,
    json['icon'] as String,
    json['isDisplayAmt'] as bool,
    json['unicode'] as String,
    json['isDeleted'] as bool,
    json['isParent'] as bool,
    json['isActicve'] as bool,
    json['orderIndex'] as int,
    json['type'] as String,
    json['color'] as String,
    json['isRequired'] as bool,
    json['isSelfOrder'] as bool,
    json['isOnlineOrder'] as bool,
    (json['nameList'] as List)
        ?.map((e) =>
            e == null ? null : NameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['modifierItems'] as List)
        ?.map((e) =>
            e == null ? null : ModifierItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModifierGroupToJson(ModifierGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'branchId': instance.branchId,
      'companyID': instance.companyID,
      'mixSelections': instance.mixSelections,
      'maxSelections': instance.maxSelections,
      'icon': instance.icon,
      'isDisplayAmt': instance.isDisplayAmt,
      'unicode': instance.unicode,
      'isDeleted': instance.isDeleted,
      'isParent': instance.isParent,
      'isActicve': instance.isActicve,
      'orderIndex': instance.orderIndex,
      'type': instance.type,
      'color': instance.color,
      'isRequired': instance.isRequired,
      'isSelfOrder': instance.isSelfOrder,
      'isOnlineOrder': instance.isOnlineOrder,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
      'modifierItems':
          instance.modifierItems?.map((e) => e?.toJson())?.toList(),
    };
