// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_modifierGroup.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemModifierGroupAdapter extends TypeAdapter<MenuItemModifierGroup> {
  @override
  final int typeId = 5;

  @override
  MenuItemModifierGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemModifierGroup(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemModifierGroup obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.menuItemID)
      ..writeByte(1)
      ..write(obj.modifierGroupID)
      ..writeByte(2)
      ..write(obj.orderIndex)
      ..writeByte(3)
      ..write(obj.parentMenuItemId)
      ..writeByte(4)
      ..write(obj.parentModifierGroupId)
      ..writeByte(5)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemModifierGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModifierGroup _$MenuItemModifierGroupFromJson(
    Map<String, dynamic> json) {
  return MenuItemModifierGroup(
    json['menuItemID'] as int,
    json['modifierGroupID'] as int,
    json['orderIndex'] as int,
    json['parentMenuItemId'] as int,
    json['parentModifierGroupId'] as int,
    json['isDeleted'] as bool,
  );
}

Map<String, dynamic> _$MenuItemModifierGroupToJson(
        MenuItemModifierGroup instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'modifierGroupID': instance.modifierGroupID,
      'orderIndex': instance.orderIndex,
      'parentMenuItemId': instance.parentMenuItemId,
      'parentModifierGroupId': instance.parentModifierGroupId,
      'isDeleted': instance.isDeleted,
    };
