// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detailList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsListAdapter extends TypeAdapter<OrderDetailsList> {
  @override
  final int typeId = 15;

  @override
  OrderDetailsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsList(
      id: fields[0] as String,
      name: fields[1] as String,
      orderID: fields[2] as String,
      companyID: fields[3] as String,
      menuItemID: fields[4] as int,
      seat: fields[5] as int,
      addedBy: fields[6] as int,
      comment: fields[7] as String,
      priceOverride: fields[8] as double,
      price: fields[9] as double,
      itemCost: fields[10] as double,
      qty: fields[11] as int,
      isOpenItem: fields[12] as bool,
      subtotalAmt: fields[13] as double,
      totalAmt: fields[14] as double,
      taxAmt: fields[15] as double,
      totalDiscountAmt: fields[16] as double,
      isCakeOrder: fields[17] as bool,
      isUsingDesignFee: fields[18] as bool,
      designFee: fields[19] as double,
      menuCategoryId: fields[20] as int,
      menuGroupId: fields[21] as int,
      salesCategoryId: fields[22] as int,
      weight: fields[23] as double,
      status: fields[24] as int,
      taxList: (fields[25] as List)?.cast<OrderDetailsTaxList>(),
      discountList: (fields[26] as List)?.cast<OrderDetailsDiscountList>(),
      modifierList: (fields[27] as List)?.cast<OrderDetailsModifierList>(),
      variantList: (fields[28] as List)?.cast<OrderDetailsVariantList>(),
      promotionList: (fields[29] as List)?.cast<OrderDetailsPromotionList>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsList obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.orderID)
      ..writeByte(3)
      ..write(obj.companyID)
      ..writeByte(4)
      ..write(obj.menuItemID)
      ..writeByte(5)
      ..write(obj.seat)
      ..writeByte(6)
      ..write(obj.addedBy)
      ..writeByte(7)
      ..write(obj.comment)
      ..writeByte(8)
      ..write(obj.priceOverride)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.itemCost)
      ..writeByte(11)
      ..write(obj.qty)
      ..writeByte(12)
      ..write(obj.isOpenItem)
      ..writeByte(13)
      ..write(obj.subtotalAmt)
      ..writeByte(14)
      ..write(obj.totalAmt)
      ..writeByte(15)
      ..write(obj.taxAmt)
      ..writeByte(16)
      ..write(obj.totalDiscountAmt)
      ..writeByte(17)
      ..write(obj.isCakeOrder)
      ..writeByte(18)
      ..write(obj.isUsingDesignFee)
      ..writeByte(19)
      ..write(obj.designFee)
      ..writeByte(20)
      ..write(obj.menuCategoryId)
      ..writeByte(21)
      ..write(obj.menuGroupId)
      ..writeByte(22)
      ..write(obj.salesCategoryId)
      ..writeByte(23)
      ..write(obj.weight)
      ..writeByte(24)
      ..write(obj.status)
      ..writeByte(25)
      ..write(obj.taxList)
      ..writeByte(26)
      ..write(obj.discountList)
      ..writeByte(27)
      ..write(obj.modifierList)
      ..writeByte(28)
      ..write(obj.variantList)
      ..writeByte(29)
      ..write(obj.promotionList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsList _$OrderDetailsListFromJson(Map<String, dynamic> json) {
  return OrderDetailsList(
    id: json['id'] as String,
    name: json['name'] as String,
    orderID: json['orderID'] as String,
    companyID: json['companyID'] as String,
    menuItemID: json['menuItemID'] as int,
    seat: json['seat'] as int,
    addedBy: json['addedBy'] as int,
    comment: json['comment'] as String,
    priceOverride: (json['priceOverride'] as num)?.toDouble(),
    price: (json['price'] as num)?.toDouble(),
    itemCost: (json['itemCost'] as num)?.toDouble(),
    qty: json['qty'] as int,
    isOpenItem: json['isOpenItem'] as bool,
    subtotalAmt: (json['subtotalAmt'] as num)?.toDouble(),
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    taxAmt: (json['taxAmt'] as num)?.toDouble(),
    totalDiscountAmt: (json['totalDiscountAmt'] as num)?.toDouble(),
    isCakeOrder: json['isCakeOrder'] as bool,
    isUsingDesignFee: json['isUsingDesignFee'] as bool,
    designFee: (json['designFee'] as num)?.toDouble(),
    menuCategoryId: json['menuCategoryId'] as int,
    menuGroupId: json['menuGroupId'] as int,
    salesCategoryId: json['salesCategoryId'] as int,
    weight: (json['weight'] as num)?.toDouble(),
    status: json['status'] as int,
    taxList: (json['taxList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsTaxList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    discountList: (json['discountList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsDiscountList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modifierList: (json['modifierList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsModifierList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variantList: (json['variantList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsVariantList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    promotionList: (json['promotionList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsPromotionList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..menuItem = json['menuItem'] == null
        ? null
        : MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>)
    ..allowRecalculation = json['allowRecalculation'] as bool
    ..orderTypeId = json['orderTypeId'] as int;
}

Map<String, dynamic> _$OrderDetailsListToJson(OrderDetailsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'orderID': instance.orderID,
      'companyID': instance.companyID,
      'menuItemID': instance.menuItemID,
      'seat': instance.seat,
      'addedBy': instance.addedBy,
      'comment': instance.comment,
      'priceOverride': instance.priceOverride,
      'price': instance.price,
      'itemCost': instance.itemCost,
      'qty': instance.qty,
      'isOpenItem': instance.isOpenItem,
      'subtotalAmt': instance.subtotalAmt,
      'totalAmt': instance.totalAmt,
      'taxAmt': instance.taxAmt,
      'totalDiscountAmt': instance.totalDiscountAmt,
      'isCakeOrder': instance.isCakeOrder,
      'isUsingDesignFee': instance.isUsingDesignFee,
      'designFee': instance.designFee,
      'menuCategoryId': instance.menuCategoryId,
      'menuGroupId': instance.menuGroupId,
      'salesCategoryId': instance.salesCategoryId,
      'weight': instance.weight,
      'status': instance.status,
      'taxList': instance.taxList?.map((e) => e?.toJson())?.toList(),
      'discountList': instance.discountList?.map((e) => e?.toJson())?.toList(),
      'modifierList': instance.modifierList?.map((e) => e?.toJson())?.toList(),
      'variantList': instance.variantList?.map((e) => e?.toJson())?.toList(),
      'promotionList':
          instance.promotionList?.map((e) => e?.toJson())?.toList(),
      'menuItem': instance.menuItem?.toJson(),
      'allowRecalculation': instance.allowRecalculation,
      'orderTypeId': instance.orderTypeId,
    };
