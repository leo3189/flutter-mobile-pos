// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemAdapter extends TypeAdapter<MenuItem> {
  @override
  final int typeId = 11;

  @override
  MenuItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItem(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as int,
      fields[5] as String,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as bool,
      fields[9] as bool,
      fields[10] as int,
      fields[11] as int,
      fields[12] as int,
      fields[13] as int,
      fields[14] as String,
      fields[15] as bool,
      fields[16] as String,
      fields[17] as double,
      fields[18] as bool,
      fields[19] as bool,
      fields[20] as bool,
      fields[21] as bool,
      fields[22] as String,
      fields[23] as String,
      fields[24] as bool,
      fields[25] as bool,
      fields[26] as String,
      fields[27] as bool,
      fields[28] as bool,
      fields[29] as bool,
      fields[30] as bool,
      (fields[31] as List)?.cast<NameList>(),
      (fields[32] as List)?.cast<MenuItemModifierGroup>(),
      (fields[33] as List)?.cast<MenuItemPrinters>(),
      (fields[34] as List)?.cast<MenuItemVariantGroup>(),
      (fields[35] as List)?.cast<MenuItemPromotion>(),
      (fields[36] as List)?.cast<MenuItemPrice>(),
      (fields[37] as List)?.cast<MenuItemTax>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuItem obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.branchID)
      ..writeByte(3)
      ..write(obj.isParent)
      ..writeByte(4)
      ..write(obj.parentId)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.onlineVisible)
      ..writeByte(8)
      ..write(obj.localVisible)
      ..writeByte(9)
      ..write(obj.isOpenItem)
      ..writeByte(10)
      ..write(obj.orderIndex)
      ..writeByte(11)
      ..write(obj.menuCategoryID)
      ..writeByte(12)
      ..write(obj.salesCategoryID)
      ..writeByte(13)
      ..write(obj.imageID)
      ..writeByte(14)
      ..write(obj.colorCode)
      ..writeByte(15)
      ..write(obj.useScale)
      ..writeByte(16)
      ..write(obj.unitType)
      ..writeByte(17)
      ..write(obj.defaultPrice)
      ..writeByte(18)
      ..write(obj.isUsingNote)
      ..writeByte(19)
      ..write(obj.isUsingPickUpDate)
      ..writeByte(20)
      ..write(obj.isMultiPrice)
      ..writeByte(21)
      ..write(obj.isUsingDesignFee)
      ..writeByte(22)
      ..write(obj.barcode)
      ..writeByte(23)
      ..write(obj.sku)
      ..writeByte(24)
      ..write(obj.active)
      ..writeByte(25)
      ..write(obj.isDeleted)
      ..writeByte(26)
      ..write(obj.inventoryType)
      ..writeByte(27)
      ..write(obj.isLinkedToCompostion)
      ..writeByte(28)
      ..write(obj.isForSelfOrder)
      ..writeByte(29)
      ..write(obj.isFullScreenModifiers)
      ..writeByte(30)
      ..write(obj.isOnlineOrder)
      ..writeByte(31)
      ..write(obj.nameList)
      ..writeByte(32)
      ..write(obj.modifierGroups)
      ..writeByte(33)
      ..write(obj.printers)
      ..writeByte(34)
      ..write(obj.variantGroups)
      ..writeByte(35)
      ..write(obj.promotionList)
      ..writeByte(36)
      ..write(obj.priceList)
      ..writeByte(37)
      ..write(obj.taxes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    json['id'] as int,
    json['companyID'] as String,
    json['branchID'] as String,
    json['isParent'] as bool,
    json['parentId'] as int,
    json['notes'] as String,
    json['description'] as String,
    json['onlineVisible'] as bool,
    json['localVisible'] as bool,
    json['isOpenItem'] as bool,
    json['orderIndex'] as int,
    json['menuCategoryID'] as int,
    json['salesCategoryID'] as int,
    json['imageID'] as int,
    json['colorCode'] as String,
    json['useScale'] as bool,
    json['unitType'] as String,
    (json['defaultPrice'] as num)?.toDouble(),
    json['isUsingNote'] as bool,
    json['isUsingPickUpDate'] as bool,
    json['isMultiPrice'] as bool,
    json['isUsingDesignFee'] as bool,
    json['barcode'] as String,
    json['sku'] as String,
    json['active'] as bool,
    json['isDeleted'] as bool,
    json['inventoryType'] as String,
    json['isLinkedToCompostion'] as bool,
    json['isForSelfOrder'] as bool,
    json['isFullScreenModifiers'] as bool,
    json['isOnlineOrder'] as bool,
    (json['nameList'] as List)
        ?.map((e) =>
            e == null ? null : NameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['modifierGroups'] as List)
        ?.map((e) => e == null
            ? null
            : MenuItemModifierGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['printers'] as List)
        ?.map((e) => e == null
            ? null
            : MenuItemPrinters.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['variantGroups'] as List)
        ?.map((e) => e == null
            ? null
            : MenuItemVariantGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['promotionList'] as List)
        ?.map((e) => e == null
            ? null
            : MenuItemPromotion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['priceList'] as List)
        ?.map((e) => e == null
            ? null
            : MenuItemPrice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['taxes'] as List)
        ?.map((e) =>
            e == null ? null : MenuItemTax.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'isParent': instance.isParent,
      'parentId': instance.parentId,
      'notes': instance.notes,
      'description': instance.description,
      'onlineVisible': instance.onlineVisible,
      'localVisible': instance.localVisible,
      'isOpenItem': instance.isOpenItem,
      'orderIndex': instance.orderIndex,
      'menuCategoryID': instance.menuCategoryID,
      'salesCategoryID': instance.salesCategoryID,
      'imageID': instance.imageID,
      'colorCode': instance.colorCode,
      'useScale': instance.useScale,
      'unitType': instance.unitType,
      'defaultPrice': instance.defaultPrice,
      'isUsingNote': instance.isUsingNote,
      'isUsingPickUpDate': instance.isUsingPickUpDate,
      'isMultiPrice': instance.isMultiPrice,
      'isUsingDesignFee': instance.isUsingDesignFee,
      'barcode': instance.barcode,
      'sku': instance.sku,
      'active': instance.active,
      'isDeleted': instance.isDeleted,
      'inventoryType': instance.inventoryType,
      'isLinkedToCompostion': instance.isLinkedToCompostion,
      'isForSelfOrder': instance.isForSelfOrder,
      'isFullScreenModifiers': instance.isFullScreenModifiers,
      'isOnlineOrder': instance.isOnlineOrder,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
      'modifierGroups':
          instance.modifierGroups?.map((e) => e?.toJson())?.toList(),
      'printers': instance.printers?.map((e) => e?.toJson())?.toList(),
      'variantGroups':
          instance.variantGroups?.map((e) => e?.toJson())?.toList(),
      'promotionList':
          instance.promotionList?.map((e) => e?.toJson())?.toList(),
      'priceList': instance.priceList?.map((e) => e?.toJson())?.toList(),
      'taxes': instance.taxes?.map((e) => e?.toJson())?.toList(),
    };
