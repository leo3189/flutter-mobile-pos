// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_receipt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KitchenReceiptAdapter extends TypeAdapter<KitchenReceipt> {
  @override
  final int typeId = 48;

  @override
  KitchenReceipt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitchenReceipt(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as int,
      fields[4] as bool,
      fields[5] as int,
      fields[6] as bool,
      fields[7] as int,
      fields[8] as bool,
      fields[9] as bool,
      fields[10] as bool,
      fields[11] as int,
      fields[12] as bool,
      fields[13] as int,
      fields[14] as bool,
      fields[15] as bool,
      fields[16] as int,
      fields[17] as bool,
      fields[18] as int,
      fields[19] as bool,
      fields[20] as bool,
      fields[21] as int,
      fields[22] as bool,
      fields[23] as bool,
      fields[24] as bool,
      fields[25] as int,
    );
  }

  @override
  void write(BinaryWriter writer, KitchenReceipt obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyId)
      ..writeByte(2)
      ..write(obj.showHeader)
      ..writeByte(3)
      ..write(obj.headerSpace)
      ..writeByte(4)
      ..write(obj.showOrderNumber)
      ..writeByte(5)
      ..write(obj.orderNumberSize)
      ..writeByte(6)
      ..write(obj.showOrderType)
      ..writeByte(7)
      ..write(obj.orderTypeSize)
      ..writeByte(8)
      ..write(obj.showNumberOfPpl)
      ..writeByte(9)
      ..write(obj.showTable)
      ..writeByte(10)
      ..write(obj.showOrderTime)
      ..writeByte(11)
      ..write(obj.orderTimeSize)
      ..writeByte(12)
      ..write(obj.showCashierInfo)
      ..writeByte(13)
      ..write(obj.cashierInfoSize)
      ..writeByte(14)
      ..write(obj.showOneQty)
      ..writeByte(15)
      ..write(obj.showAbbreviate)
      ..writeByte(16)
      ..write(obj.orderItemSize)
      ..writeByte(17)
      ..write(obj.dividedLine)
      ..writeByte(18)
      ..write(obj.footerSpace)
      ..writeByte(19)
      ..write(obj.cutOneByOne)
      ..writeByte(20)
      ..write(obj.separatedModification)
      ..writeByte(21)
      ..write(obj.modificationSize)
      ..writeByte(22)
      ..write(obj.splitSameItems)
      ..writeByte(23)
      ..write(obj.showPrice)
      ..writeByte(24)
      ..write(obj.orderRemark)
      ..writeByte(25)
      ..write(obj.orderRemarkSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KitchenReceiptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitchenReceipt _$KitchenReceiptFromJson(Map<String, dynamic> json) {
  return KitchenReceipt(
    json['id'] as String,
    json['companyId'] as String,
    json['showHeader'] as bool,
    json['headerSpace'] as int,
    json['showOrderNumber'] as bool,
    json['orderNumberSize'] as int,
    json['showOrderType'] as bool,
    json['orderTypeSize'] as int,
    json['showNumberOfPpl'] as bool,
    json['showTable'] as bool,
    json['showOrderTime'] as bool,
    json['orderTimeSize'] as int,
    json['showCashierInfo'] as bool,
    json['cashierInfoSize'] as int,
    json['showOneQty'] as bool,
    json['showAbbreviate'] as bool,
    json['orderItemSize'] as int,
    json['dividedLine'] as bool,
    json['footerSpace'] as int,
    json['cutOneByOne'] as bool,
    json['separatedModification'] as bool,
    json['modificationSize'] as int,
    json['splitSameItems'] as bool,
    json['showPrice'] as bool,
    json['orderRemark'] as bool,
    json['orderRemarkSize'] as int,
  );
}

Map<String, dynamic> _$KitchenReceiptToJson(KitchenReceipt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'showHeader': instance.showHeader,
      'headerSpace': instance.headerSpace,
      'showOrderNumber': instance.showOrderNumber,
      'orderNumberSize': instance.orderNumberSize,
      'showOrderType': instance.showOrderType,
      'orderTypeSize': instance.orderTypeSize,
      'showNumberOfPpl': instance.showNumberOfPpl,
      'showTable': instance.showTable,
      'showOrderTime': instance.showOrderTime,
      'orderTimeSize': instance.orderTimeSize,
      'showCashierInfo': instance.showCashierInfo,
      'cashierInfoSize': instance.cashierInfoSize,
      'showOneQty': instance.showOneQty,
      'showAbbreviate': instance.showAbbreviate,
      'orderItemSize': instance.orderItemSize,
      'dividedLine': instance.dividedLine,
      'footerSpace': instance.footerSpace,
      'cutOneByOne': instance.cutOneByOne,
      'separatedModification': instance.separatedModification,
      'modificationSize': instance.modificationSize,
      'splitSameItems': instance.splitSameItems,
      'showPrice': instance.showPrice,
      'orderRemark': instance.orderRemark,
      'orderRemarkSize': instance.orderRemarkSize,
    };
