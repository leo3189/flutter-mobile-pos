// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_menuCategory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuMenuCategoryAdapter extends TypeAdapter<MenuMenuCategory> {
  @override
  final int typeId = 3;

  @override
  MenuMenuCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuMenuCategory(
      fields[0] as int,
      fields[5] as dynamic,
      fields[1] as int,
      fields[2] as int,
      fields[4] as dynamic,
      fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MenuMenuCategory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.menuID)
      ..writeByte(1)
      ..write(obj.menuCategoryID)
      ..writeByte(2)
      ..write(obj.orderIndex)
      ..writeByte(3)
      ..write(obj.parentMenuId)
      ..writeByte(4)
      ..write(obj.parentMenuCategoryId)
      ..writeByte(5)
      ..write(obj.menuCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuMenuCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuMenuCategory _$MenuMenuCategoryFromJson(Map<String, dynamic> json) {
  return MenuMenuCategory(
    json['menuID'] as int,
    json['menuCategory'],
    json['menuCategoryID'] as int,
    json['orderIndex'] as int,
    json['parentMenuCategoryId'],
    json['parentMenuId'],
  );
}

Map<String, dynamic> _$MenuMenuCategoryToJson(MenuMenuCategory instance) =>
    <String, dynamic>{
      'menuID': instance.menuID,
      'menuCategoryID': instance.menuCategoryID,
      'orderIndex': instance.orderIndex,
      'parentMenuId': instance.parentMenuId,
      'parentMenuCategoryId': instance.parentMenuCategoryId,
      'menuCategory': instance.menuCategory,
    };
