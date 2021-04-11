// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemPriceAdapter extends TypeAdapter<MenuItemPrice> {
  @override
  final int typeId = 9;

  @override
  MenuItemPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemPrice(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as double,
      fields[4] as int,
      fields[5] as int,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as int,
      fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemPrice obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.menuItemID)
      ..writeByte(1)
      ..write(obj.orderTypeID)
      ..writeByte(2)
      ..write(obj.variantIds)
      ..writeByte(3)
      ..write(obj.designFee)
      ..writeByte(4)
      ..write(obj.parentMenuItemId)
      ..writeByte(5)
      ..write(obj.parentOrderTypeId)
      ..writeByte(6)
      ..write(obj.parentVariantIds)
      ..writeByte(7)
      ..write(obj.isDefault)
      ..writeByte(8)
      ..write(obj.orderIndex)
      ..writeByte(9)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemPrice _$MenuItemPriceFromJson(Map<String, dynamic> json) {
  return MenuItemPrice(
    json['menuItemID'] as int,
    json['orderTypeID'] as int,
    json['variantIds'] as String,
    (json['designFee'] as num)?.toDouble(),
    json['parentMenuItemId'] as int,
    json['parentOrderTypeId'] as int,
    json['parentVariantIds'] as String,
    json['isDefault'] as bool,
    json['orderIndex'] as int,
    (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MenuItemPriceToJson(MenuItemPrice instance) =>
    <String, dynamic>{
      'menuItemID': instance.menuItemID,
      'orderTypeID': instance.orderTypeID,
      'variantIds': instance.variantIds,
      'designFee': instance.designFee,
      'parentMenuItemId': instance.parentMenuItemId,
      'parentOrderTypeId': instance.parentOrderTypeId,
      'parentVariantIds': instance.parentVariantIds,
      'isDefault': instance.isDefault,
      'orderIndex': instance.orderIndex,
      'price': instance.price,
    };
