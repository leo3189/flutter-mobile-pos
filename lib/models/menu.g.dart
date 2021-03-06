// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuAdapter extends TypeAdapter<Menu> {
  @override
  final int typeId = 1;

  @override
  Menu read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Menu(
      fields[0] as dynamic,
      fields[1] as bool,
      fields[2] as bool,
      fields[3] as bool,
      fields[4] as bool,
      fields[5] as bool,
      fields[6] as bool,
      fields[7] as int,
      fields[8] as String,
      fields[9] as String,
      fields[10] as int,
      fields[11] as dynamic,
      fields[12] as String,
      fields[13] as bool,
      fields[14] as bool,
      fields[15] as String,
      (fields[16] as List)?.cast<NameList>(),
      (fields[17] as List)?.cast<MenuMenuCategory>(),
      (fields[18] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Menu obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.parentId)
      ..writeByte(1)
      ..write(obj.isParent)
      ..writeByte(2)
      ..write(obj.onlineVisible)
      ..writeByte(3)
      ..write(obj.localVisible)
      ..writeByte(4)
      ..write(obj.active)
      ..writeByte(5)
      ..write(obj.isDeleted)
      ..writeByte(6)
      ..write(obj.isForSelfOrder)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.branchID)
      ..writeByte(9)
      ..write(obj.companyID)
      ..writeByte(10)
      ..write(obj.orderIndex)
      ..writeByte(11)
      ..write(obj.colorCode)
      ..writeByte(12)
      ..write(obj.icon)
      ..writeByte(13)
      ..write(obj.isUsingSchedule)
      ..writeByte(14)
      ..write(obj.is3LevelMenu)
      ..writeByte(15)
      ..write(obj.unicode)
      ..writeByte(16)
      ..write(obj.nameList)
      ..writeByte(17)
      ..write(obj.menuCategories)
      ..writeByte(18)
      ..write(obj.menuItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    json['parentId'],
    json['isParent'] as bool,
    json['onlineVisible'] as bool,
    json['localVisible'] as bool,
    json['active'] as bool,
    json['isDeleted'] as bool,
    json['isForSelfOrder'] as bool,
    json['id'] as int,
    json['branchID'] as String,
    json['companyID'] as String,
    json['orderIndex'] as int,
    json['colorCode'],
    json['icon'] as String,
    json['isUsingSchedule'] as bool,
    json['is3LevelMenu'] as bool,
    json['unicode'] as String,
    (json['nameList'] as List)
        ?.map((e) =>
            e == null ? null : NameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['menuCategories'] as List)
        ?.map((e) => e == null
            ? null
            : MenuMenuCategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['menuItems'] as List,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'parentId': instance.parentId,
      'isParent': instance.isParent,
      'onlineVisible': instance.onlineVisible,
      'localVisible': instance.localVisible,
      'active': instance.active,
      'isDeleted': instance.isDeleted,
      'isForSelfOrder': instance.isForSelfOrder,
      'id': instance.id,
      'branchID': instance.branchID,
      'companyID': instance.companyID,
      'orderIndex': instance.orderIndex,
      'colorCode': instance.colorCode,
      'icon': instance.icon,
      'isUsingSchedule': instance.isUsingSchedule,
      'is3LevelMenu': instance.is3LevelMenu,
      'unicode': instance.unicode,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
      'menuCategories':
          instance.menuCategories?.map((e) => e?.toJson())?.toList(),
      'menuItems': instance.menuItems,
    };
