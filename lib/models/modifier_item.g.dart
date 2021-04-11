// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModifierItemAdapter extends TypeAdapter<ModifierItem> {
  @override
  final int typeId = 12;

  @override
  ModifierItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModifierItem(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as double,
      fields[4] as double,
      fields[5] as bool,
      fields[6] as bool,
      fields[7] as bool,
      fields[8] as bool,
      fields[9] as int,
      fields[10] as bool,
      fields[11] as int,
      fields[12] as bool,
      fields[13] as bool,
      fields[14] as int,
      (fields[15] as List)?.cast<NameList>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModifierItem obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.branchId)
      ..writeByte(2)
      ..write(obj.modifierGroupID)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.price2)
      ..writeByte(5)
      ..write(obj.isMandatory)
      ..writeByte(6)
      ..write(obj.isDefault)
      ..writeByte(7)
      ..write(obj.enabled)
      ..writeByte(8)
      ..write(obj.isDeleted)
      ..writeByte(9)
      ..write(obj.orderIndex)
      ..writeByte(10)
      ..write(obj.isParent)
      ..writeByte(11)
      ..write(obj.parentId)
      ..writeByte(12)
      ..write(obj.noteRequired)
      ..writeByte(13)
      ..write(obj.isOnlineOrder)
      ..writeByte(14)
      ..write(obj.imageID)
      ..writeByte(15)
      ..write(obj.nameList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModifierItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifierItem _$ModifierItemFromJson(Map<String, dynamic> json) {
  return ModifierItem(
    json['id'] as int,
    json['branchId'] as String,
    json['modifierGroupID'] as int,
    (json['price'] as num)?.toDouble(),
    (json['price2'] as num)?.toDouble(),
    json['isMandatory'] as bool,
    json['isDefault'] as bool,
    json['enabled'] as bool,
    json['isDeleted'] as bool,
    json['orderIndex'] as int,
    json['isParent'] as bool,
    json['parentId'] as int,
    json['noteRequired'] as bool,
    json['isOnlineOrder'] as bool,
    json['imageID'] as int,
    (json['nameList'] as List)
        ?.map((e) =>
            e == null ? null : NameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModifierItemToJson(ModifierItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchId': instance.branchId,
      'modifierGroupID': instance.modifierGroupID,
      'price': instance.price,
      'price2': instance.price2,
      'isMandatory': instance.isMandatory,
      'isDefault': instance.isDefault,
      'enabled': instance.enabled,
      'isDeleted': instance.isDeleted,
      'orderIndex': instance.orderIndex,
      'isParent': instance.isParent,
      'parentId': instance.parentId,
      'noteRequired': instance.noteRequired,
      'isOnlineOrder': instance.isOnlineOrder,
      'imageID': instance.imageID,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
    };
