// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_receipt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesReceiptAdapter extends TypeAdapter<SalesReceipt> {
  @override
  final int typeId = 47;

  @override
  SalesReceipt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesReceipt(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as int,
      fields[4] as bool,
      fields[5] as bool,
      fields[6] as int,
      fields[7] as String,
      fields[8] as bool,
      fields[9] as int,
      fields[10] as bool,
      fields[11] as int,
      fields[12] as bool,
      fields[13] as bool,
      fields[23] as int,
      fields[15] as bool,
      fields[16] as int,
      fields[17] as bool,
      fields[18] as int,
      fields[19] as bool,
      fields[20] as bool,
      fields[21] as int,
      fields[22] as bool,
      fields[14] as int,
      fields[24] as bool,
      fields[25] as bool,
      fields[26] as bool,
      fields[27] as int,
      fields[28] as bool,
      fields[29] as bool,
      fields[30] as bool,
      fields[31] as int,
      fields[32] as int,
      fields[33] as bool,
      fields[34] as int,
      fields[35] as bool,
      fields[36] as int,
      fields[37] as bool,
      fields[38] as bool,
      fields[39] as bool,
      fields[40] as int,
      fields[41] as bool,
      fields[42] as bool,
      fields[43] as bool,
      fields[44] as int,
      fields[45] as String,
      fields[46] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SalesReceipt obj) {
    writer
      ..writeByte(47)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.showHeader)
      ..writeByte(3)
      ..write(obj.headerSpace)
      ..writeByte(4)
      ..write(obj.showLogo)
      ..writeByte(5)
      ..write(obj.showStoreInfo)
      ..writeByte(6)
      ..write(obj.storeInfoSize)
      ..writeByte(7)
      ..write(obj.headerText)
      ..writeByte(8)
      ..write(obj.showOrderNumber)
      ..writeByte(9)
      ..write(obj.orderNumberSize)
      ..writeByte(10)
      ..write(obj.showTable)
      ..writeByte(11)
      ..write(obj.tableSize)
      ..writeByte(12)
      ..write(obj.showNumberOfPpl)
      ..writeByte(13)
      ..write(obj.showOrderTime)
      ..writeByte(14)
      ..write(obj.orderTimeSize)
      ..writeByte(15)
      ..write(obj.showCashierInfo)
      ..writeByte(16)
      ..write(obj.cashierInfoSize)
      ..writeByte(17)
      ..write(obj.showCustomerInfo)
      ..writeByte(18)
      ..write(obj.customerInfoSize)
      ..writeByte(19)
      ..write(obj.showOrder)
      ..writeByte(20)
      ..write(obj.orderRemark)
      ..writeByte(21)
      ..write(obj.orderRemarkSize)
      ..writeByte(22)
      ..write(obj.showOneQty)
      ..writeByte(23)
      ..write(obj.orderItemSize)
      ..writeByte(24)
      ..write(obj.showAbbreviate)
      ..writeByte(25)
      ..write(obj.showModGroupName)
      ..writeByte(26)
      ..write(obj.separateModification)
      ..writeByte(27)
      ..write(obj.modificationSize)
      ..writeByte(28)
      ..write(obj.dividedLine)
      ..writeByte(29)
      ..write(obj.splitSameItems)
      ..writeByte(30)
      ..write(obj.showPaymentInfo)
      ..writeByte(31)
      ..write(obj.subtotalSize)
      ..writeByte(32)
      ..write(obj.totalAmtSize)
      ..writeByte(33)
      ..write(obj.showPaymentType)
      ..writeByte(34)
      ..write(obj.paymentTypeSize)
      ..writeByte(35)
      ..write(obj.showPaymentStatus)
      ..writeByte(36)
      ..write(obj.paymentStatusSize)
      ..writeByte(37)
      ..write(obj.showPONumber)
      ..writeByte(38)
      ..write(obj.showBarcode)
      ..writeByte(39)
      ..write(obj.showTips)
      ..writeByte(40)
      ..write(obj.tipsSize)
      ..writeByte(41)
      ..write(obj.showOffers)
      ..writeByte(42)
      ..write(obj.taxExemptProof)
      ..writeByte(43)
      ..write(obj.showFooter)
      ..writeByte(44)
      ..write(obj.footerTextSize)
      ..writeByte(45)
      ..write(obj.footerText)
      ..writeByte(46)
      ..write(obj.footerSpace);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesReceiptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReceipt _$SalesReceiptFromJson(Map<String, dynamic> json) {
  return SalesReceipt(
    json['id'] as String,
    json['companyID'] as String,
    json['showHeader'] as bool,
    json['headerSpace'] as int,
    json['showLogo'] as bool,
    json['showStoreInfo'] as bool,
    json['storeInfoSize'] as int,
    json['headerText'] as String,
    json['showOrderNumber'] as bool,
    json['orderNumberSize'] as int,
    json['showTable'] as bool,
    json['tableSize'] as int,
    json['showNumberOfPpl'] as bool,
    json['showOrderTime'] as bool,
    json['orderItemSize'] as int,
    json['showCashierInfo'] as bool,
    json['cashierInfoSize'] as int,
    json['showCustomerInfo'] as bool,
    json['customerInfoSize'] as int,
    json['showOrder'] as bool,
    json['orderRemark'] as bool,
    json['orderRemarkSize'] as int,
    json['showOneQty'] as bool,
    json['orderTimeSize'] as int,
    json['showAbbreviate'] as bool,
    json['showModGroupName'] as bool,
    json['separateModification'] as bool,
    json['modificationSize'] as int,
    json['dividedLine'] as bool,
    json['splitSameItems'] as bool,
    json['showPaymentInfo'] as bool,
    json['subtotalSize'] as int,
    json['totalAmtSize'] as int,
    json['showPaymentType'] as bool,
    json['paymentTypeSize'] as int,
    json['showPaymentStatus'] as bool,
    json['paymentStatusSize'] as int,
    json['showPONumber'] as bool,
    json['showBarcode'] as bool,
    json['showTips'] as bool,
    json['tipsSize'] as int,
    json['showOffers'] as bool,
    json['taxExemptProof'] as bool,
    json['showFooter'] as bool,
    json['footerTextSize'] as int,
    json['footerText'] as String,
    json['footerSpace'] as int,
  );
}

Map<String, dynamic> _$SalesReceiptToJson(SalesReceipt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'showHeader': instance.showHeader,
      'headerSpace': instance.headerSpace,
      'showLogo': instance.showLogo,
      'showStoreInfo': instance.showStoreInfo,
      'storeInfoSize': instance.storeInfoSize,
      'headerText': instance.headerText,
      'showOrderNumber': instance.showOrderNumber,
      'orderNumberSize': instance.orderNumberSize,
      'showTable': instance.showTable,
      'tableSize': instance.tableSize,
      'showNumberOfPpl': instance.showNumberOfPpl,
      'showOrderTime': instance.showOrderTime,
      'orderTimeSize': instance.orderTimeSize,
      'showCashierInfo': instance.showCashierInfo,
      'cashierInfoSize': instance.cashierInfoSize,
      'showCustomerInfo': instance.showCustomerInfo,
      'customerInfoSize': instance.customerInfoSize,
      'showOrder': instance.showOrder,
      'orderRemark': instance.orderRemark,
      'orderRemarkSize': instance.orderRemarkSize,
      'showOneQty': instance.showOneQty,
      'orderItemSize': instance.orderItemSize,
      'showAbbreviate': instance.showAbbreviate,
      'showModGroupName': instance.showModGroupName,
      'separateModification': instance.separateModification,
      'modificationSize': instance.modificationSize,
      'dividedLine': instance.dividedLine,
      'splitSameItems': instance.splitSameItems,
      'showPaymentInfo': instance.showPaymentInfo,
      'subtotalSize': instance.subtotalSize,
      'totalAmtSize': instance.totalAmtSize,
      'showPaymentType': instance.showPaymentType,
      'paymentTypeSize': instance.paymentTypeSize,
      'showPaymentStatus': instance.showPaymentStatus,
      'paymentStatusSize': instance.paymentStatusSize,
      'showPONumber': instance.showPONumber,
      'showBarcode': instance.showBarcode,
      'showTips': instance.showTips,
      'tipsSize': instance.tipsSize,
      'showOffers': instance.showOffers,
      'taxExemptProof': instance.taxExemptProof,
      'showFooter': instance.showFooter,
      'footerTextSize': instance.footerTextSize,
      'footerText': instance.footerText,
      'footerSpace': instance.footerSpace,
    };
