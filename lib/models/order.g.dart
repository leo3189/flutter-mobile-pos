// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 16;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as String,
      companyID: fields[1] as String,
      branchID: fields[2] as String,
      orderTypeID: fields[3] as int,
      numOfGuest: fields[4] as int,
      createdBy: fields[5] as int,
      customerID: fields[6] as String,
      checkInTime: fields[7] as String,
      changeAmt: fields[19] as double,
      toGoTime: fields[8] as String,
      tipsPercentage: fields[9] as double,
      serviceChargePercentage: fields[10] as double,
      tipsAmt: fields[11] as double,
      serviceChargeAmt: fields[12] as double,
      deliveryFee: fields[13] as double,
      orderStatus: fields[14] as int,
      subtotalAmt: fields[15] as double,
      totalAmt: fields[16] as double,
      totalCost: fields[17] as double,
      totalTaxAmt: fields[20] as double,
      totalDiscountAmt: fields[21] as double,
      orderDiscountAmt: fields[22] as double,
      isCakeOrder: fields[23] as bool,
      pickupLocation: fields[24] as String,
      note: fields[25] as String,
      terminal: fields[26] as String,
      customerPhone: fields[27] as String,
      customerAddress: fields[28] as String,
      customerEmail: fields[30] as String,
      tableID: fields[31] as String,
      tableName: fields[32] as String,
      seqNum: fields[33] as int,
      taxList: (fields[34] as List)?.cast<OrderTaxList>(),
      discountList: (fields[35] as List)?.cast<OrderDiscountList>(),
      detailsList: (fields[36] as List)?.cast<OrderDetailsList>(),
      paidAmt: fields[18] as double,
      customerName: fields[29] as String,
      isReprint: fields[37] as bool,
      completedBy: fields[38] as int,
      depositAmt: fields[39] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(40)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.branchID)
      ..writeByte(3)
      ..write(obj.orderTypeID)
      ..writeByte(4)
      ..write(obj.numOfGuest)
      ..writeByte(5)
      ..write(obj.createdBy)
      ..writeByte(6)
      ..write(obj.customerID)
      ..writeByte(7)
      ..write(obj.checkInTime)
      ..writeByte(8)
      ..write(obj.toGoTime)
      ..writeByte(9)
      ..write(obj.tipsPercentage)
      ..writeByte(10)
      ..write(obj.serviceChargePercentage)
      ..writeByte(11)
      ..write(obj.tipsAmt)
      ..writeByte(12)
      ..write(obj.serviceChargeAmt)
      ..writeByte(13)
      ..write(obj.deliveryFee)
      ..writeByte(14)
      ..write(obj.orderStatus)
      ..writeByte(15)
      ..write(obj.subtotalAmt)
      ..writeByte(16)
      ..write(obj.totalAmt)
      ..writeByte(17)
      ..write(obj.totalCost)
      ..writeByte(18)
      ..write(obj.paidAmt)
      ..writeByte(19)
      ..write(obj.changeAmt)
      ..writeByte(20)
      ..write(obj.totalTaxAmt)
      ..writeByte(21)
      ..write(obj.totalDiscountAmt)
      ..writeByte(22)
      ..write(obj.orderDiscountAmt)
      ..writeByte(23)
      ..write(obj.isCakeOrder)
      ..writeByte(24)
      ..write(obj.pickupLocation)
      ..writeByte(25)
      ..write(obj.note)
      ..writeByte(26)
      ..write(obj.terminal)
      ..writeByte(27)
      ..write(obj.customerPhone)
      ..writeByte(28)
      ..write(obj.customerAddress)
      ..writeByte(29)
      ..write(obj.customerName)
      ..writeByte(30)
      ..write(obj.customerEmail)
      ..writeByte(31)
      ..write(obj.tableID)
      ..writeByte(32)
      ..write(obj.tableName)
      ..writeByte(33)
      ..write(obj.seqNum)
      ..writeByte(34)
      ..write(obj.taxList)
      ..writeByte(35)
      ..write(obj.discountList)
      ..writeByte(36)
      ..write(obj.detailsList)
      ..writeByte(37)
      ..write(obj.isReprint)
      ..writeByte(38)
      ..write(obj.completedBy)
      ..writeByte(39)
      ..write(obj.depositAmt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as String,
    companyID: json['companyID'] as String,
    branchID: json['branchID'] as String,
    orderTypeID: json['orderTypeID'] as int,
    numOfGuest: json['numOfGuest'] as int,
    createdBy: json['createdBy'] as int,
    customerID: json['customerID'] as String,
    checkInTime: json['checkInTime'] as String,
    changeAmt: (json['changeAmt'] as num)?.toDouble(),
    toGoTime: json['toGoTime'] as String,
    tipsPercentage: (json['tipsPercentage'] as num)?.toDouble(),
    serviceChargePercentage:
        (json['serviceChargePercentage'] as num)?.toDouble(),
    tipsAmt: (json['tipsAmt'] as num)?.toDouble(),
    serviceChargeAmt: (json['serviceChargeAmt'] as num)?.toDouble(),
    deliveryFee: (json['deliveryFee'] as num)?.toDouble(),
    orderStatus: json['orderStatus'] as int,
    subtotalAmt: (json['subtotalAmt'] as num)?.toDouble(),
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    totalCost: (json['totalCost'] as num)?.toDouble(),
    totalTaxAmt: (json['totalTaxAmt'] as num)?.toDouble(),
    totalDiscountAmt: (json['totalDiscountAmt'] as num)?.toDouble(),
    orderDiscountAmt: (json['orderDiscountAmt'] as num)?.toDouble(),
    isCakeOrder: json['isCakeOrder'] as bool,
    pickupLocation: json['pickupLocation'] as String,
    note: json['note'] as String,
    terminal: json['terminal'] as String,
    customerPhone: json['customerPhone'] as String,
    customerAddress: json['customerAddress'] as String,
    customerEmail: json['customerEmail'] as String,
    tableID: json['tableID'] as String,
    tableName: json['tableName'] as String,
    seqNum: json['seqNum'] as int,
    taxList: (json['taxList'] as List)
        ?.map((e) =>
            e == null ? null : OrderTaxList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    discountList: (json['discountList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDiscountList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    detailsList: (json['detailsList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    paidAmt: (json['paidAmt'] as num)?.toDouble(),
    customerName: json['customerName'] as String,
    isReprint: json['isReprint'] as bool,
    completedBy: json['completedBy'] as int,
    depositAmt: (json['depositAmt'] as num)?.toDouble(),
  )
    ..taxId = json['taxId'] as String
    ..taxExempt = json['taxExempt'] as bool;
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'orderTypeID': instance.orderTypeID,
      'numOfGuest': instance.numOfGuest,
      'createdBy': instance.createdBy,
      'customerID': instance.customerID,
      'checkInTime': instance.checkInTime,
      'toGoTime': instance.toGoTime,
      'tipsPercentage': instance.tipsPercentage,
      'serviceChargePercentage': instance.serviceChargePercentage,
      'tipsAmt': instance.tipsAmt,
      'serviceChargeAmt': instance.serviceChargeAmt,
      'deliveryFee': instance.deliveryFee,
      'orderStatus': instance.orderStatus,
      'subtotalAmt': instance.subtotalAmt,
      'totalAmt': instance.totalAmt,
      'totalCost': instance.totalCost,
      'paidAmt': instance.paidAmt,
      'changeAmt': instance.changeAmt,
      'totalTaxAmt': instance.totalTaxAmt,
      'totalDiscountAmt': instance.totalDiscountAmt,
      'orderDiscountAmt': instance.orderDiscountAmt,
      'isCakeOrder': instance.isCakeOrder,
      'pickupLocation': instance.pickupLocation,
      'note': instance.note,
      'terminal': instance.terminal,
      'customerPhone': instance.customerPhone,
      'customerAddress': instance.customerAddress,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'tableID': instance.tableID,
      'tableName': instance.tableName,
      'seqNum': instance.seqNum,
      'taxList': instance.taxList?.map((e) => e?.toJson())?.toList(),
      'discountList': instance.discountList?.map((e) => e?.toJson())?.toList(),
      'detailsList': instance.detailsList?.map((e) => e?.toJson())?.toList(),
      'isReprint': instance.isReprint,
      'completedBy': instance.completedBy,
      'depositAmt': instance.depositAmt,
      'taxId': instance.taxId,
      'taxExempt': instance.taxExempt,
    };
