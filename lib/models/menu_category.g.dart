// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuCategoryAdapter extends TypeAdapter<MenuCategory> {
  @override
  final int typeId = 4;

  @override
  MenuCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuCategory(
      fields[0] as int,
      fields[1] as int,
      fields[2] as bool,
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
      fields[6] as String,
      fields[7] as String,
      fields[8] as bool,
      fields[9] as bool,
      fields[10] as bool,
      fields[11] as bool,
      fields[12] as bool,
      fields[13] as bool,
      fields[14] as bool,
      fields[15] as String,
      fields[16] as bool,
      fields[17] as int,
      fields[18] as bool,
      fields[19] as bool,
      (fields[20] as List)?.cast<NameList>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuCategory obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.isParent)
      ..writeByte(3)
      ..write(obj.companyID)
      ..writeByte(4)
      ..write(obj.branchID)
      ..writeByte(5)
      ..write(obj.salesCategoryID)
      ..writeByte(6)
      ..write(obj.icon)
      ..writeByte(7)
      ..write(obj.colorCode)
      ..writeByte(8)
      ..write(obj.active)
      ..writeByte(9)
      ..write(obj.isUsingSchedule)
      ..writeByte(10)
      ..write(obj.onlineVisible)
      ..writeByte(11)
      ..write(obj.localVisible)
      ..writeByte(12)
      ..write(obj.isInventoryCategory)
      ..writeByte(13)
      ..write(obj.isUsingNote)
      ..writeByte(14)
      ..write(obj.isUsingPickUpDate)
      ..writeByte(15)
      ..write(obj.unicode)
      ..writeByte(16)
      ..write(obj.isDeleted)
      ..writeByte(17)
      ..write(obj.orderIndex)
      ..writeByte(18)
      ..write(obj.isForSelfOrder)
      ..writeByte(19)
      ..write(obj.isOnlineOrder)
      ..writeByte(20)
      ..write(obj.nameList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) {
  return MenuCategory(
    json['id'] as int,
    json['parentId'] as int,
    json['isParent'] as bool,
    json['companyID'] as String,
    json['branchID'] as String,
    json['salesCategoryID'] as int,
    json['icon'] as String,
    json['colorCode'] as String,
    json['active'] as bool,
    json['isUsingSchedule'] as bool,
    json['onlineVisible'] as bool,
    json['localVisible'] as bool,
    json['isInventoryCategory'] as bool,
    json['isUsingNote'] as bool,
    json['isUsingPickUpDate'] as bool,
    json['unicode'] as String,
    json['isDeleted'] as bool,
    json['orderIndex'] as int,
    json['isForSelfOrder'] as bool,
    json['isOnlineOrder'] as bool,
    (json['nameList'] as List)
        ?.map((e) =>
            e == null ? null : NameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'isParent': instance.isParent,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'salesCategoryID': instance.salesCategoryID,
      'icon': instance.icon,
      'colorCode': instance.colorCode,
      'active': instance.active,
      'isUsingSchedule': instance.isUsingSchedule,
      'onlineVisible': instance.onlineVisible,
      'localVisible': instance.localVisible,
      'isInventoryCategory': instance.isInventoryCategory,
      'isUsingNote': instance.isUsingNote,
      'isUsingPickUpDate': instance.isUsingPickUpDate,
      'unicode': instance.unicode,
      'isDeleted': instance.isDeleted,
      'orderIndex': instance.orderIndex,
      'isForSelfOrder': instance.isForSelfOrder,
      'isOnlineOrder': instance.isOnlineOrder,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
    };
