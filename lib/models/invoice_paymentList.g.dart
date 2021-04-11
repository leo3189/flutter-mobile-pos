// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_paymentList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoicePaymentListAdapter extends TypeAdapter<InvoicePaymentList> {
  @override
  final int typeId = 25;

  @override
  InvoicePaymentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoicePaymentList(
      id: fields[0] as String,
      invoiceID: fields[1] as String,
      staffName: fields[2] as String,
      paymentTypeID: fields[3] as int,
      orderAmt: fields[4] as double,
      paidAmt: fields[5] as double,
      tipsAmt: fields[6] as double,
      taxAmt: fields[7] as double,
      cardNumber: fields[8] as String,
      creditCardTypeId: fields[9] as int,
      certificateID: fields[10] as int,
      companyID: fields[11] as String,
      branchId: fields[12] as String,
      invoiceTime: fields[13] as String,
      voucherGroupID: fields[14] as int,
      isVoided: fields[15] as bool,
      isDeposit: fields[16] as bool,
      isCouponRate: fields[17] as bool,
      couponID: fields[18] as String,
      customName: fields[20] as String,
      customerID: fields[21] as String,
      note: fields[22] as String,
      creditCardTransactions:
          (fields[23] as List)?.cast<PaymentListCreditCardTransactions>(),
      serviceChargeAmt: fields[24] as double,
      couponAmt: fields[19] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InvoicePaymentList obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.invoiceID)
      ..writeByte(2)
      ..write(obj.staffName)
      ..writeByte(3)
      ..write(obj.paymentTypeID)
      ..writeByte(4)
      ..write(obj.orderAmt)
      ..writeByte(5)
      ..write(obj.paidAmt)
      ..writeByte(6)
      ..write(obj.tipsAmt)
      ..writeByte(7)
      ..write(obj.taxAmt)
      ..writeByte(8)
      ..write(obj.cardNumber)
      ..writeByte(9)
      ..write(obj.creditCardTypeId)
      ..writeByte(10)
      ..write(obj.certificateID)
      ..writeByte(11)
      ..write(obj.companyID)
      ..writeByte(12)
      ..write(obj.branchId)
      ..writeByte(13)
      ..write(obj.invoiceTime)
      ..writeByte(14)
      ..write(obj.voucherGroupID)
      ..writeByte(15)
      ..write(obj.isVoided)
      ..writeByte(16)
      ..write(obj.isDeposit)
      ..writeByte(17)
      ..write(obj.isCouponRate)
      ..writeByte(18)
      ..write(obj.couponID)
      ..writeByte(19)
      ..write(obj.couponAmt)
      ..writeByte(20)
      ..write(obj.customName)
      ..writeByte(21)
      ..write(obj.customerID)
      ..writeByte(22)
      ..write(obj.note)
      ..writeByte(23)
      ..write(obj.creditCardTransactions)
      ..writeByte(24)
      ..write(obj.serviceChargeAmt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoicePaymentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaymentListCreditCardTransactionsAdapter
    extends TypeAdapter<PaymentListCreditCardTransactions> {
  @override
  final int typeId = 26;

  @override
  PaymentListCreditCardTransactions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentListCreditCardTransactions(
      id: fields[0] as String,
      companyID: fields[1] as String,
      branchID: fields[2] as String,
      paymentId: fields[3] as String,
      invoiceId: fields[4] as String,
      orderIndex: fields[5] as int,
      staffId: fields[6] as int,
      invoiceType: fields[7] as int,
      saleAmount: fields[8] as double,
      totalAmount: fields[9] as double,
      authCode: fields[10] as String,
      cardNum: fields[11] as String,
      cardType: fields[12] as String,
      ecrRefNum: fields[14] as String,
      expDate: fields[15] as String,
      isBatchClosed: fields[16] as bool,
      nameOnCard: fields[17] as String,
      refNum: fields[18] as String,
      status: fields[19] as String,
      statusID: fields[20] as int,
      taxAmount: fields[21] as double,
      tipAmount: fields[22] as double,
      transactionTime: fields[23] as String,
      signature: fields[24] as String,
      creditTerminalType: fields[25] as int,
      posName: fields[26] as String,
      terminalIP: fields[27] as String,
      terminalPort: fields[28] as String,
      invoiceNumber: fields[29] as int,
    )..cardTypeID = fields[13] as int;
  }

  @override
  void write(BinaryWriter writer, PaymentListCreditCardTransactions obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.branchID)
      ..writeByte(3)
      ..write(obj.paymentId)
      ..writeByte(4)
      ..write(obj.invoiceId)
      ..writeByte(5)
      ..write(obj.orderIndex)
      ..writeByte(6)
      ..write(obj.staffId)
      ..writeByte(7)
      ..write(obj.invoiceType)
      ..writeByte(8)
      ..write(obj.saleAmount)
      ..writeByte(9)
      ..write(obj.totalAmount)
      ..writeByte(10)
      ..write(obj.authCode)
      ..writeByte(11)
      ..write(obj.cardNum)
      ..writeByte(12)
      ..write(obj.cardType)
      ..writeByte(13)
      ..write(obj.cardTypeID)
      ..writeByte(14)
      ..write(obj.ecrRefNum)
      ..writeByte(15)
      ..write(obj.expDate)
      ..writeByte(16)
      ..write(obj.isBatchClosed)
      ..writeByte(17)
      ..write(obj.nameOnCard)
      ..writeByte(18)
      ..write(obj.refNum)
      ..writeByte(19)
      ..write(obj.status)
      ..writeByte(20)
      ..write(obj.statusID)
      ..writeByte(21)
      ..write(obj.taxAmount)
      ..writeByte(22)
      ..write(obj.tipAmount)
      ..writeByte(23)
      ..write(obj.transactionTime)
      ..writeByte(24)
      ..write(obj.signature)
      ..writeByte(25)
      ..write(obj.creditTerminalType)
      ..writeByte(26)
      ..write(obj.posName)
      ..writeByte(27)
      ..write(obj.terminalIP)
      ..writeByte(28)
      ..write(obj.terminalPort)
      ..writeByte(29)
      ..write(obj.invoiceNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentListCreditCardTransactionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicePaymentList _$InvoicePaymentListFromJson(Map<String, dynamic> json) {
  return InvoicePaymentList(
    id: json['id'] as String,
    invoiceID: json['invoiceID'] as String,
    staffName: json['staffName'] as String,
    paymentTypeID: json['paymentTypeID'] as int,
    orderAmt: (json['orderAmt'] as num)?.toDouble(),
    paidAmt: (json['paidAmt'] as num)?.toDouble(),
    tipsAmt: (json['tipsAmt'] as num)?.toDouble(),
    taxAmt: (json['taxAmt'] as num)?.toDouble(),
    cardNumber: json['cardNumber'] as String,
    creditCardTypeId: json['creditCardTypeId'] as int,
    certificateID: json['certificateID'] as int,
    companyID: json['companyID'] as String,
    branchId: json['branchId'] as String,
    invoiceTime: json['invoiceTime'] as String,
    voucherGroupID: json['voucherGroupID'] as int,
    isVoided: json['isVoided'] as bool,
    isDeposit: json['isDeposit'] as bool,
    isCouponRate: json['isCouponRate'] as bool,
    couponID: json['couponID'] as String,
    customName: json['customName'] as String,
    customerID: json['customerID'] as String,
    note: json['note'] as String,
    creditCardTransactions: (json['creditCardTransactions'] as List)
        ?.map((e) => e == null
            ? null
            : PaymentListCreditCardTransactions.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    serviceChargeAmt: (json['serviceChargeAmt'] as num)?.toDouble(),
    couponAmt: json['couponAmt'] as int,
  );
}

Map<String, dynamic> _$InvoicePaymentListToJson(InvoicePaymentList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceID': instance.invoiceID,
      'staffName': instance.staffName,
      'paymentTypeID': instance.paymentTypeID,
      'orderAmt': instance.orderAmt,
      'paidAmt': instance.paidAmt,
      'tipsAmt': instance.tipsAmt,
      'taxAmt': instance.taxAmt,
      'cardNumber': instance.cardNumber,
      'creditCardTypeId': instance.creditCardTypeId,
      'certificateID': instance.certificateID,
      'companyID': instance.companyID,
      'branchId': instance.branchId,
      'invoiceTime': instance.invoiceTime,
      'voucherGroupID': instance.voucherGroupID,
      'isVoided': instance.isVoided,
      'isDeposit': instance.isDeposit,
      'isCouponRate': instance.isCouponRate,
      'couponID': instance.couponID,
      'couponAmt': instance.couponAmt,
      'customName': instance.customName,
      'customerID': instance.customerID,
      'note': instance.note,
      'creditCardTransactions':
          instance.creditCardTransactions?.map((e) => e?.toJson())?.toList(),
      'serviceChargeAmt': instance.serviceChargeAmt,
    };

PaymentListCreditCardTransactions _$PaymentListCreditCardTransactionsFromJson(
    Map<String, dynamic> json) {
  return PaymentListCreditCardTransactions(
    id: json['id'] as String,
    companyID: json['companyID'] as String,
    branchID: json['branchID'] as String,
    paymentId: json['paymentId'] as String,
    invoiceId: json['invoiceId'] as String,
    orderIndex: json['orderIndex'] as int,
    staffId: json['staffId'] as int,
    invoiceType: json['invoiceType'] as int,
    saleAmount: (json['saleAmount'] as num)?.toDouble(),
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    authCode: json['authCode'] as String,
    cardNum: json['cardNum'] as String,
    cardType: json['cardType'] as String,
    ecrRefNum: json['ecrRefNum'] as String,
    expDate: json['expDate'] as String,
    isBatchClosed: json['isBatchClosed'] as bool,
    nameOnCard: json['nameOnCard'] as String,
    refNum: json['refNum'] as String,
    status: json['status'] as String,
    statusID: json['statusID'] as int,
    taxAmount: (json['taxAmount'] as num)?.toDouble(),
    tipAmount: (json['tipAmount'] as num)?.toDouble(),
    transactionTime: json['transactionTime'] as String,
    signature: json['signature'] as String,
    creditTerminalType: json['creditTerminalType'] as int,
    posName: json['posName'] as String,
    terminalIP: json['terminalIP'] as String,
    terminalPort: json['terminalPort'] as String,
    invoiceNumber: json['invoiceNumber'] as int,
  )..cardTypeID = json['cardTypeID'] as int;
}

Map<String, dynamic> _$PaymentListCreditCardTransactionsToJson(
        PaymentListCreditCardTransactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'paymentId': instance.paymentId,
      'invoiceId': instance.invoiceId,
      'orderIndex': instance.orderIndex,
      'staffId': instance.staffId,
      'invoiceType': instance.invoiceType,
      'saleAmount': instance.saleAmount,
      'totalAmount': instance.totalAmount,
      'authCode': instance.authCode,
      'cardNum': instance.cardNum,
      'cardType': instance.cardType,
      'cardTypeID': instance.cardTypeID,
      'ecrRefNum': instance.ecrRefNum,
      'expDate': instance.expDate,
      'isBatchClosed': instance.isBatchClosed,
      'nameOnCard': instance.nameOnCard,
      'refNum': instance.refNum,
      'status': instance.status,
      'statusID': instance.statusID,
      'taxAmount': instance.taxAmount,
      'tipAmount': instance.tipAmount,
      'transactionTime': instance.transactionTime,
      'signature': instance.signature,
      'creditTerminalType': instance.creditTerminalType,
      'posName': instance.posName,
      'terminalIP': instance.terminalIP,
      'terminalPort': instance.terminalPort,
      'invoiceNumber': instance.invoiceNumber,
    };
