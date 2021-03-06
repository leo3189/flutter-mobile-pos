// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceAdapter extends TypeAdapter<Invoice> {
  @override
  final int typeId = 33;

  @override
  Invoice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invoice(
      id: fields[0] as String,
      companyID: fields[1] as String,
      branchID: fields[2] as String,
      orderID: fields[3] as String,
      numOfGuest: fields[4] as int,
      orderSeqNum: fields[5] as int,
      invoiceNum: fields[6] as int,
      invoiceTime: fields[7] as String,
      closeTime: fields[8] as String,
      status: fields[9] as int,
      orderBy: fields[10] as int,
      createdBy: fields[11] as int,
      voidedBy: fields[12] as int,
      customerID: fields[13] as String,
      tipsAmt: fields[14] as double,
      serviceChargeAmt: fields[15] as double,
      totalTaxAmt: fields[16] as double,
      totalDiscountAmt: fields[17] as double,
      orderDiscountAmt: fields[18] as double,
      subTotalAmt: fields[19] as double,
      totalAmt: fields[20] as double,
      totalCost: fields[21] as double,
      paidAmt: fields[22] as double,
      changeAmt: fields[23] as double,
      depositAmt: fields[24] as double,
      balanceAmt: fields[25] as double,
      deliveryFee: fields[26] as double,
      isLastCheck: fields[27] as bool,
      orderTypeID: fields[28] as int,
      terminal: fields[29] as String,
      isReprint: fields[30] as bool,
      printedCount: fields[31] as int,
      pickupLocation: fields[32] as String,
      toGoTime: fields[33] as String,
      isCakeOrder: fields[34] as bool,
      customerPhone: fields[35] as String,
      customerAddress: fields[36] as String,
      customerName: fields[37] as String,
      tableID: fields[38] as String,
      tableName: fields[39] as String,
      splitTotal: fields[40] as int,
      splitIndex: fields[41] as int,
      splitType: fields[42] as int,
      paymentList: (fields[43] as List)?.cast<InvoicePaymentList>(),
      detailsList: (fields[44] as List)?.cast<InvoiceDetailsList>(),
      discountList: (fields[45] as List)?.cast<InvoiceDiscountList>(),
      taxList: (fields[46] as List)?.cast<InvoiceTaxList>(),
      note: fields[47] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Invoice obj) {
    writer
      ..writeByte(48)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.branchID)
      ..writeByte(3)
      ..write(obj.orderID)
      ..writeByte(4)
      ..write(obj.numOfGuest)
      ..writeByte(5)
      ..write(obj.orderSeqNum)
      ..writeByte(6)
      ..write(obj.invoiceNum)
      ..writeByte(7)
      ..write(obj.invoiceTime)
      ..writeByte(8)
      ..write(obj.closeTime)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.orderBy)
      ..writeByte(11)
      ..write(obj.createdBy)
      ..writeByte(12)
      ..write(obj.voidedBy)
      ..writeByte(13)
      ..write(obj.customerID)
      ..writeByte(14)
      ..write(obj.tipsAmt)
      ..writeByte(15)
      ..write(obj.serviceChargeAmt)
      ..writeByte(16)
      ..write(obj.totalTaxAmt)
      ..writeByte(17)
      ..write(obj.totalDiscountAmt)
      ..writeByte(18)
      ..write(obj.orderDiscountAmt)
      ..writeByte(19)
      ..write(obj.subTotalAmt)
      ..writeByte(20)
      ..write(obj.totalAmt)
      ..writeByte(21)
      ..write(obj.totalCost)
      ..writeByte(22)
      ..write(obj.paidAmt)
      ..writeByte(23)
      ..write(obj.changeAmt)
      ..writeByte(24)
      ..write(obj.depositAmt)
      ..writeByte(25)
      ..write(obj.balanceAmt)
      ..writeByte(26)
      ..write(obj.deliveryFee)
      ..writeByte(27)
      ..write(obj.isLastCheck)
      ..writeByte(28)
      ..write(obj.orderTypeID)
      ..writeByte(29)
      ..write(obj.terminal)
      ..writeByte(30)
      ..write(obj.isReprint)
      ..writeByte(31)
      ..write(obj.printedCount)
      ..writeByte(32)
      ..write(obj.pickupLocation)
      ..writeByte(33)
      ..write(obj.toGoTime)
      ..writeByte(34)
      ..write(obj.isCakeOrder)
      ..writeByte(35)
      ..write(obj.customerPhone)
      ..writeByte(36)
      ..write(obj.customerAddress)
      ..writeByte(37)
      ..write(obj.customerName)
      ..writeByte(38)
      ..write(obj.tableID)
      ..writeByte(39)
      ..write(obj.tableName)
      ..writeByte(40)
      ..write(obj.splitTotal)
      ..writeByte(41)
      ..write(obj.splitIndex)
      ..writeByte(42)
      ..write(obj.splitType)
      ..writeByte(43)
      ..write(obj.paymentList)
      ..writeByte(44)
      ..write(obj.detailsList)
      ..writeByte(45)
      ..write(obj.discountList)
      ..writeByte(46)
      ..write(obj.taxList)
      ..writeByte(47)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceDiscountListAdapter extends TypeAdapter<InvoiceDiscountList> {
  @override
  final int typeId = 34;

  @override
  InvoiceDiscountList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDiscountList(
      id: fields[0] as String,
      invoiceID: fields[1] as String,
      discountID: fields[2] as int,
      discountBy: fields[3] as int,
      name: fields[4] as String,
      rate: fields[5] as double,
      amt: fields[6] as double,
      isAmtDiscount: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDiscountList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceID)
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
      other is InvoiceDiscountListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvoiceTaxListAdapter extends TypeAdapter<InvoiceTaxList> {
  @override
  final int typeId = 24;

  @override
  InvoiceTaxList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceTaxList(
      id: fields[0] as String,
      invoiceID: fields[1] as String,
      taxID: fields[2] as int,
      name: fields[3] as String,
      taxRate: fields[4] as double,
      amt: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceTaxList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceID)
      ..writeByte(2)
      ..write(obj.taxID)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.taxRate)
      ..writeByte(5)
      ..write(obj.amt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceTaxListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    id: json['id'] as String,
    companyID: json['companyID'] as String,
    branchID: json['branchID'] as String,
    orderID: json['orderID'] as String,
    numOfGuest: json['numOfGuest'] as int,
    orderSeqNum: json['orderSeqNum'] as int,
    invoiceNum: json['invoiceNum'] as int,
    invoiceTime: json['invoiceTime'] as String,
    closeTime: json['closeTime'] as String,
    status: json['status'] as int,
    orderBy: json['orderBy'] as int,
    createdBy: json['createdBy'] as int,
    voidedBy: json['voidedBy'] as int,
    customerID: json['customerID'] as String,
    tipsAmt: (json['tipsAmt'] as num)?.toDouble(),
    serviceChargeAmt: (json['serviceChargeAmt'] as num)?.toDouble(),
    totalTaxAmt: (json['totalTaxAmt'] as num)?.toDouble(),
    totalDiscountAmt: (json['totalDiscountAmt'] as num)?.toDouble(),
    orderDiscountAmt: (json['orderDiscountAmt'] as num)?.toDouble(),
    subTotalAmt: (json['subTotalAmt'] as num)?.toDouble(),
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    totalCost: (json['totalCost'] as num)?.toDouble(),
    paidAmt: (json['paidAmt'] as num)?.toDouble(),
    changeAmt: (json['changeAmt'] as num)?.toDouble(),
    depositAmt: (json['depositAmt'] as num)?.toDouble(),
    balanceAmt: (json['balanceAmt'] as num)?.toDouble(),
    deliveryFee: (json['deliveryFee'] as num)?.toDouble(),
    isLastCheck: json['isLastCheck'] as bool,
    orderTypeID: json['orderTypeID'] as int,
    terminal: json['terminal'] as String,
    isReprint: json['isReprint'] as bool,
    printedCount: json['printedCount'] as int,
    pickupLocation: json['pickupLocation'] as String,
    toGoTime: json['toGoTime'] as String,
    isCakeOrder: json['isCakeOrder'] as bool,
    customerPhone: json['customerPhone'] as String,
    customerAddress: json['customerAddress'] as String,
    customerName: json['customerName'] as String,
    tableID: json['tableID'] as String,
    tableName: json['tableName'] as String,
    splitTotal: json['splitTotal'] as int,
    splitIndex: json['splitIndex'] as int,
    splitType: json['splitType'] as int,
    paymentList: (json['paymentList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoicePaymentList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    detailsList: (json['detailsList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDetailsList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    discountList: (json['discountList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceDiscountList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    taxList: (json['taxList'] as List)
        ?.map((e) => e == null
            ? null
            : InvoiceTaxList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    note: json['note'] as String,
  )..serviceChargePercentage =
      (json['serviceChargePercentage'] as num)?.toDouble();
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'orderID': instance.orderID,
      'numOfGuest': instance.numOfGuest,
      'orderSeqNum': instance.orderSeqNum,
      'invoiceNum': instance.invoiceNum,
      'invoiceTime': instance.invoiceTime,
      'closeTime': instance.closeTime,
      'status': instance.status,
      'orderBy': instance.orderBy,
      'createdBy': instance.createdBy,
      'voidedBy': instance.voidedBy,
      'customerID': instance.customerID,
      'tipsAmt': instance.tipsAmt,
      'serviceChargeAmt': instance.serviceChargeAmt,
      'totalTaxAmt': instance.totalTaxAmt,
      'totalDiscountAmt': instance.totalDiscountAmt,
      'orderDiscountAmt': instance.orderDiscountAmt,
      'subTotalAmt': instance.subTotalAmt,
      'totalAmt': instance.totalAmt,
      'totalCost': instance.totalCost,
      'paidAmt': instance.paidAmt,
      'changeAmt': instance.changeAmt,
      'depositAmt': instance.depositAmt,
      'balanceAmt': instance.balanceAmt,
      'deliveryFee': instance.deliveryFee,
      'isLastCheck': instance.isLastCheck,
      'orderTypeID': instance.orderTypeID,
      'terminal': instance.terminal,
      'isReprint': instance.isReprint,
      'printedCount': instance.printedCount,
      'pickupLocation': instance.pickupLocation,
      'toGoTime': instance.toGoTime,
      'isCakeOrder': instance.isCakeOrder,
      'customerPhone': instance.customerPhone,
      'customerAddress': instance.customerAddress,
      'customerName': instance.customerName,
      'tableID': instance.tableID,
      'tableName': instance.tableName,
      'splitTotal': instance.splitTotal,
      'splitIndex': instance.splitIndex,
      'splitType': instance.splitType,
      'paymentList': instance.paymentList?.map((e) => e?.toJson())?.toList(),
      'detailsList': instance.detailsList?.map((e) => e?.toJson())?.toList(),
      'discountList': instance.discountList?.map((e) => e?.toJson())?.toList(),
      'taxList': instance.taxList?.map((e) => e?.toJson())?.toList(),
      'note': instance.note,
      'serviceChargePercentage': instance.serviceChargePercentage,
    };

InvoiceDiscountList _$InvoiceDiscountListFromJson(Map<String, dynamic> json) {
  return InvoiceDiscountList(
    id: json['id'] as String,
    invoiceID: json['invoiceID'] as String,
    discountID: json['discountID'] as int,
    discountBy: json['discountBy'] as int,
    name: json['name'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    amt: (json['amt'] as num)?.toDouble(),
    isAmtDiscount: json['isAmtDiscount'] as bool,
  );
}

Map<String, dynamic> _$InvoiceDiscountListToJson(
        InvoiceDiscountList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceID': instance.invoiceID,
      'discountID': instance.discountID,
      'discountBy': instance.discountBy,
      'name': instance.name,
      'rate': instance.rate,
      'amt': instance.amt,
      'isAmtDiscount': instance.isAmtDiscount,
    };

InvoiceTaxList _$InvoiceTaxListFromJson(Map<String, dynamic> json) {
  return InvoiceTaxList(
    id: json['id'] as String,
    invoiceID: json['invoiceID'] as String,
    taxID: json['taxID'] as int,
    name: json['name'] as String,
    taxRate: (json['taxRate'] as num)?.toDouble(),
    amt: (json['amt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$InvoiceTaxListToJson(InvoiceTaxList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceID': instance.invoiceID,
      'taxID': instance.taxID,
      'name': instance.name,
      'taxRate': instance.taxRate,
      'amt': instance.amt,
    };
