// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_tax.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemTaxAdapter extends TypeAdapter<MenuItemTax> {
  @override
  final int typeId = 10;

  @override
  MenuItemTax read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemTax(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemTax obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.menuItemId)
      ..writeByte(1)
      ..write(obj.taxId)
      ..writeByte(2)
      ..write(obj.parentMenuItemId)
      ..writeByte(3)
      ..write(obj.parentTaxId)
      ..writeByte(4)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemTaxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemTax _$MenuItemTaxFromJson(Map<String, dynamic> json) {
  return MenuItemTax(
    json['menuItemId'] as int,
    json['taxId'] as int,
    json['parentMenuItemId'] as int,
    json['parentTaxId'] as int,
    json['isDeleted'] as bool,
  );
}

Map<String, dynamic> _$MenuItemTaxToJson(MenuItemTax instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'taxId': instance.taxId,
      'parentMenuItemId': instance.parentMenuItemId,
      'parentTaxId': instance.parentTaxId,
      'isDeleted': instance.isDeleted,
    };
