// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_printers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemPrintersAdapter extends TypeAdapter<MenuItemPrinters> {
  @override
  final int typeId = 6;

  @override
  MenuItemPrinters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemPrinters(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemPrinters obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.menuItemID)
      ..writeByte(1)
      ..write(obj.printerID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemPrintersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemPrinters _$MenuItemPrintersFromJson(Map<String, dynamic> json) {
  return MenuItemPrinters(
    json['menuItemID'] as int,
    json['printerID'] as String,
  );
}

Map<String, dynamic> _$MenuItemPrintersToJson(MenuItemPrinters instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'printerID': instance.printerID,
    };
