// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_variantGroup.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemVariantGroupAdapter extends TypeAdapter<MenuItemVariantGroup> {
  @override
  final int typeId = 7;

  @override
  MenuItemVariantGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemVariantGroup(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemVariantGroup obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.menuItemID)
      ..writeByte(1)
      ..write(obj.variantGroupID)
      ..writeByte(2)
      ..write(obj.orderIndex)
      ..writeByte(3)
      ..write(obj.parentMenuItemId)
      ..writeByte(4)
      ..write(obj.parentVariantGroupId)
      ..writeByte(5)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemVariantGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemVariantGroup _$MenuItemVariantGroupFromJson(Map<String, dynamic> json) {
  return MenuItemVariantGroup(
    json['menuItemID'] as int,
    json['variantGroupID'] as int,
    json['orderIndex'] as int,
    json['parentMenuItemId'] as int,
    json['parentVariantGroupId'] as int,
    json['isDeleted'] as bool,
  );
}

Map<String, dynamic> _$MenuItemVariantGroupToJson(
        MenuItemVariantGroup instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'variantGroupID': instance.variantGroupID,
      'orderIndex': instance.orderIndex,
      'parentMenuItemId': instance.parentMenuItemId,
      'parentVariantGroupId': instance.parentVariantGroupId,
      'isDeleted': instance.isDeleted,
    };
