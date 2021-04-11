// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem_promotion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemPromotionAdapter extends TypeAdapter<MenuItemPromotion> {
  @override
  final int typeId = 8;

  @override
  MenuItemPromotion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemPromotion(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemPromotion obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.promotionID)
      ..writeByte(1)
      ..write(obj.menuItemID)
      ..writeByte(2)
      ..write(obj.parentPromotionId)
      ..writeByte(3)
      ..write(obj.parentMenuItemId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemPromotionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemPromotion _$MenuItemPromotionFromJson(Map<String, dynamic> json) {
  return MenuItemPromotion(
    json['promotionID'] as int,
    json['menuItemID'] as int,
    json['parentPromotionId'] as int,
    json['parentMenuItemId'] as int,
  );
}

Map<String, dynamic> _$MenuItemPromotionToJson(MenuItemPromotion instance) =>
    <String, dynamic>{
      'promotionID': instance.promotionID,
      'menuItemID': instance.menuItemID,
      'parentPromotionId': instance.parentPromotionId,
      'parentMenuItemId': instance.parentMenuItemId,
    };
