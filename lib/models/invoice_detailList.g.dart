// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detailList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceDetailsListAdapter extends TypeAdapter<InvoiceDetailsList> {
  @override
  final int typeId = 27;

  @override
  InvoiceDetailsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsList(
      id: fields[0] as String,
      orderDetailsId: fields[1] as String,
      invoiceID: fields[2] as String,
      companyID: fields[3] as String,
      invoiceTime: fields[4] as String,
      branchId: fields[5] as String,
      menuItemID: fields[6] as int,
      qty: fields[7] as int,
      price: fields[8] as double,
      itemCost: fields[9] as double,
      taxAmt: fields[10] as double,
      totalDiscountAmt: fields[11] as double,
      subTotalAmt: fields[12] as double,
      totalAmt: fields[13] as double,
      comment: fields[14] as String,
      isUsingDesignFee: fields[15] as bool,
      designFee: fields[16] as double,
      menuCategoryId: fields[17] as int,
      menuGroupId: fields[18] as int,
      salesCategoryId: fields[19] as int,
      weight: fields[20] as double,
      status: fields[21] as int,
      modifierList:
          (fields[22] as List)?.cast<InvoiceDetailsListModifierList>(),
      discountList:
          (fields[23] as List)?.cast<InvoiceDetailsListDiscountList>(),
      taxList: (fields[24] as List)?.cast<InvoiceDetailsListTaxList>(),
      variantList: (fields[25] as List)?.cast<InvoiceDetailsListVariantList>(),
      promotionList:
          (fields[26] as List)?.cast<InvoiceDetailsListPromotionList>(),
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsList obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDetailsId)
      ..writeByte(2)
      ..write(obj.invoiceID)
      ..writeByte(3)
      ..write(obj.companyID)
      ..writeByte(4)
      ..write(obj.invoiceTime)
      ..writeByte(5)
      ..write(obj.branchId)
      ..writeByte(6)
      ..write(obj.menuItemID)
      ..writeByte(7)
      ..write(obj.qty)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.itemCost)
      ..writeByte(10)
      ..write(obj.taxAmt)
      ..writeByte(11)
      ..write(obj.totalDiscountAmt)
      ..writeByte(12)
      ..write(obj.subTotalAmt)
      ..writeByte(13)
      ..write(obj.totalAmt)
      ..writeByte(14)
      ..write(obj.comment)
      ..writeByte(15)
      ..write(obj.isUsingDesignFee)
      ..writeByte(16)
      ..write(obj.designFee)
      ..writeByte(17)
      ..write(obj.menuCategoryId)
      ..writeByte(18)
      ..write(obj.menuGroupId)
      ..writeByte(19)
      ..write(obj.salesCategoryId)
      ..writeByte(20)
      ..write(obj.weight)
      ..writeByte(21)
      ..write(obj.status)
      ..writeByte(22)
      ..write(obj.modifierList)
      ..writeByte(23)
      ..write(obj.discountList)
      ..writeByte(24)
      ..write(obj.taxList)
      ..writeByte(25)
      ..write(obj.variantList)
      ..writeByte(26)
      ..write(obj.promotionList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDetailsListModifierListAdapter
    extends TypeAdapter<InvoiceDetailsListModifierList> {
  @override
  final int typeId = 28;

  @override
  InvoiceDetailsListModifierList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsListModifierList(
      id: fields[0] as String,
      invoiceDetailsID: fields[1] as String,
      modifierItemID: fields[2] as int,
      qty: fields[3] as int,
      totalAmt: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsListModifierList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceDetailsID)
      ..writeByte(2)
      ..write(obj.modifierItemID)
      ..writeByte(3)
      ..write(obj.qty)
      ..writeByte(4)
      ..write(obj.totalAmt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListModifierListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDetailsListDiscountListAdapter
    extends TypeAdapter<InvoiceDetailsListDiscountList> {
  @override
  final int typeId = 29;

  @override
  InvoiceDetailsListDiscountList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsListDiscountList(
      id: fields[0] as String,
      invoiceDetailsID: fields[1] as String,
      discountID: fields[2] as int,
      discountBy: fields[3] as int,
      name: fields[4] as String,
      rate: fields[5] as double,
      amt: fields[6] as double,
      isAmtDiscount: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsListDiscountList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceDetailsID)
      ..writeByte(2)
      ..write(obj.discountID)
      ..writeByte(3)
      ..write(obj.discountBy)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.amt)
      ..writeByte(7)
      ..write(obj.isAmtDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListDiscountListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDetailsListTaxListAdapter
    extends TypeAdapter<InvoiceDetailsListTaxList> {
  @override
  final int typeId = 30;

  @override
  InvoiceDetailsListTaxList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsListTaxList(
      invoiceDetailsID: fields[0] as String,
      taxRate: fields[3] as double,
      taxID: fields[1] as int,
      amt: fields[4] as double,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsListTaxList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.invoiceDetailsID)
      ..writeByte(1)
      ..write(obj.taxID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.taxRate)
      ..writeByte(4)
      ..write(obj.amt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListTaxListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDetailsListVariantListAdapter
    extends TypeAdapter<InvoiceDetailsListVariantList> {
  @override
  final int typeId = 31;

  @override
  InvoiceDetailsListVariantList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsListVariantList(
      invoiceDetailsID: fields[0] as String,
      variantID: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsListVariantList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.invoiceDetailsID)
      ..writeByte(1)
      ..write(obj.variantID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListVariantListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDetailsListPromotionListAdapter
    extends TypeAdapter<InvoiceDetailsListPromotionList> {
  @override
  final int typeId = 32;

  @override
  InvoiceDetailsListPromotionList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetailsListPromotionList(
      id: fields[0] as String,
      invoiceDetailsID: fields[1] as String,
      promotionID: fields[2] as int,
      description: fields[3] as String,
      amt: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetailsListPromotionList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceDetailsID)
      ..writeByte(2)
      ..write(obj.promotionID)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.amt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsListPromotionListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDetailsList _$InvoiceDetailsListFromJson(Map<String, dynamic> json) {
  return InvoiceDetailsList(
    id: json['id'] as String,
    orderDetailsId: json['orderDetailsId'] as String,
    invoiceID: json['invoiceID'] as String,
    companyID: json['companyID'] as String,
    invoiceTime: json['invoiceTime'] as String,
    branchId: json['branchId'] as String,
    menuItemID: json['menuItemID'] as int,
    qty: json['qty'] as int,
    price: (json['price'] as num)?.toDouble(),
    itemCost: (json['itemCost'] as num)?.toDouble(),
    taxAmt: (json['taxAmt'] as num)?.toDouble(),
    totalDiscountAmt: (json['totalDiscountAmt'] as num)?.toDouble(),
    subTotalAmt: (json['subTotalAmt'] as num)?.toDouble(),
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    comment: json['comment'] as String,
    isUsingDesignFee: json['isUsingDesignFee'] as bool,
    designFee: (json['designFee'] as num)?.toDouble(),
    menuCategoryId: json['menuCategoryId'] as int,
    menuGroupId: json['menuGroupId'] as int,
    salesCategoryId: json['salesCategoryId'] as int,
    weight: (json['weight'] as num)?.toDouble(),
    status: json['status'] as int,
    modifierList: (json['modifierList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsListModifierList.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    discountList: (json['discountList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsListDiscountList.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    taxList: (json['taxList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsListTaxList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variantList: (json['variantList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsListVariantList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    promotionList: (json['promotionList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsListPromotionList.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InvoiceDetailsListToJson(InvoiceDetailsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDetailsId': instance.orderDetailsId,
      'invoiceID': instance.invoiceID,
      'companyID': instance.companyID,
      'invoiceTime': instance.invoiceTime,
      'branchId': instance.branchId,
      'menuItemID': instance.menuItemID,
      'qty': instance.qty,
      'price': instance.price,
      'itemCost': instance.itemCost,
      'taxAmt': instance.taxAmt,
      'totalDiscountAmt': instance.totalDiscountAmt,
      'subTotalAmt': instance.subTotalAmt,
      'totalAmt': instance.totalAmt,
      'comment': instance.comment,
      'isUsingDesignFee': instance.isUsingDesignFee,
      'designFee': instance.designFee,
      'menuCategoryId': instance.menuCategoryId,
      'menuGroupId': instance.menuGroupId,
      'salesCategoryId': instance.salesCategoryId,
      'weight': instance.weight,
      'status': instance.status,
      'modifierList': instance.modifierList?.map((e) => e?.toJson())?.toList(),
      'discountList': instance.discountList?.map((e) => e?.toJson())?.toList(),
      'taxList': instance.taxList?.map((e) => e?.toJson())?.toList(),
      'variantList': instance.variantList?.map((e) => e?.toJson())?.toList(),
      'promotionList':
          instance.promotionList?.map((e) => e?.toJson())?.toList(),
    };

InvoiceDetailsListModifierList _$InvoiceDetailsListModifierListFromJson(
    Map<String, dynamic> json) {
  return InvoiceDetailsListModifierList(
    id: json['id'] as String,
    invoiceDetailsID: json['invoiceDetailsID'] as String,
    modifierItemID: json['modifierItemID'] as int,
    qty: json['qty'] as int,
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$InvoiceDetailsListModifierListToJson(
        InvoiceDetailsListModifierList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceDetailsID': instance.invoiceDetailsID,
      'modifierItemID': instance.modifierItemID,
      'qty': instance.qty,
      'totalAmt': instance.totalAmt,
    };

InvoiceDetailsListDiscountList _$InvoiceDetailsListDiscountListFromJson(
    Map<String, dynamic> json) {
  return InvoiceDetailsListDiscountList(
    id: json['id'] as String,
    invoiceDetailsID: json['invoiceDetailsID'] as String,
    discountID: json['discountID'] as int,
    discountBy: json['discountBy'] as int,
    name: json['name'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    amt: (json['amt'] as num)?.toDouble(),
    isAmtDiscount: json['isAmtDiscount'] as bool,
  );
}

Map<String, dynamic> _$InvoiceDetailsListDiscountListToJson(
        InvoiceDetailsListDiscountList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceDetailsID': instance.invoiceDetailsID,
      'discountID': instance.discountID,
      'discountBy': instance.discountBy,
      'name': instance.name,
      'rate': instance.rate,
      'amt': instance.amt,
      'isAmtDiscount': instance.isAmtDiscount,
    };

InvoiceDetailsListTaxList _$InvoiceDetailsListTaxListFromJson(
    Map<String, dynamic> json) {
  return InvoiceDetailsListTaxList(
    invoiceDetailsID: json['invoiceDetailsID'] as String,
    taxRate: (json['taxRate'] as num)?.toDouble(),
    taxID: json['taxID'] as int,
    amt: (json['amt'] as num)?.toDouble(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$InvoiceDetailsListTaxListToJson(
        InvoiceDetailsListTaxList instance) =>
    <String, dynamic>{
      'invoiceDetailsID': instance.invoiceDetailsID,
      'taxID': instance.taxID,
      'name': instance.name,
      'taxRate': instance.taxRate,
      'amt': instance.amt,
    };

InvoiceDetailsListVariantList _$InvoiceDetailsListVariantListFromJson(
    Map<String, dynamic> json) {
  return InvoiceDetailsListVariantList(
    invoiceDetailsID: json['invoiceDetailsID'] as String,
    variantID: json['variantID'] as int,
  );
}

Map<String, dynamic> _$InvoiceDetailsListVariantListToJson(
        InvoiceDetailsListVariantList instance) =>
    <String, dynamic>{
      'invoiceDetailsID': instance.invoiceDetailsID,
      'variantID': instance.variantID,
    };

InvoiceDetailsListPromotionList _$InvoiceDetailsListPromotionListFromJson(
    Map<String, dynamic> json) {
  return InvoiceDetailsListPromotionList(
    id: json['id'] as String,
    invoiceDetailsID: json['invoiceDetailsID'] as String,
    promotionID: json['promotionID'] as int,
    description: json['description'] as String,
    amt: (json['amt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$InvoiceDetailsListPromotionListToJson(
        InvoiceDetailsListPromotionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceDetailsID': instance.invoiceDetailsID,
      'promotionID': instance.promotionID,
      'description': instance.description,
      'amt': instance.amt,
    };
