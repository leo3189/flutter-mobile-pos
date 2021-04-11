import 'dart:math';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:xpress_mobile_pos/helpers/sp_helper.dart';
import 'package:xpress_mobile_pos/models/invoice.dart';

part 'invoice_paymentList.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 25)
class InvoicePaymentList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceID;
  @HiveField(2)
  String staffName;
  @HiveField(3)
  int paymentTypeID;
  @HiveField(4)
  double orderAmt;
  @HiveField(5)
  double paidAmt = 0;
  @HiveField(6)
  double tipsAmt;
  @HiveField(7)
  double taxAmt = 0;
  @HiveField(8)
  String cardNumber;
  @HiveField(9)
  int creditCardTypeId;
  @HiveField(10)
  int certificateID;
  @HiveField(11)
  String companyID;
  @HiveField(12)
  String branchId;
  @HiveField(13)
  String invoiceTime;
  @HiveField(14)
  int voucherGroupID;
  @HiveField(15)
  bool isVoided = false;
  @HiveField(16)
  bool isDeposit = false;
  @HiveField(17)
  bool isCouponRate = false;
  @HiveField(18)
  String couponID;
  @HiveField(19)
  int couponAmt = 0;
  @HiveField(20)
  String customName;
  @HiveField(21)
  String customerID;
  @HiveField(22)
  String note;
  @HiveField(23)
  List<PaymentListCreditCardTransactions> creditCardTransactions;
  @HiveField(24)
  double serviceChargeAmt = 0;

  InvoicePaymentList({
    this.id,
    this.invoiceID,
    this.staffName,
    this.paymentTypeID,
    this.orderAmt,
    this.paidAmt,
    this.tipsAmt,
    this.taxAmt,
    this.cardNumber,
    this.creditCardTypeId,
    this.certificateID,
    this.companyID,
    this.branchId,
    this.invoiceTime,
    this.voucherGroupID,
    this.isVoided,
    this.isDeposit,
    this.isCouponRate,
    this.couponID,
    this.customName,
    this.customerID,
    this.note,
    this.creditCardTransactions,
    this.serviceChargeAmt,
    this.couponAmt
  });

  factory InvoicePaymentList.fromJson(Map<String, dynamic> json) => _$InvoicePaymentListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoicePaymentListToJson(this);

  InvoicePaymentList.init(String invoiceId, double amountDue, {double tip = 0, double tax = 0, double serviceCharge = 0}) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    this.invoiceTime = DateTime.now().toString();
    this.companyID = SpHelper.getString('companyId');
    this.branchId = SpHelper.getString('branchId');
    this.staffName = 'leo';
    this.creditCardTransactions = [];
    this.invoiceID = invoiceId;
    this.orderAmt = amountDue;
    this.tipsAmt = tip;
    this.taxAmt = tax;
  }

  Invoice _invoice;

  InvoicePaymentList.withInvoice(Invoice invoice) {
    _invoice = invoice;
  }

  InvoicePaymentList makeCashPayment(double paidAmount) {
    var payment = new InvoicePaymentList.init(_invoice.id, _invoice.balanceAmt);
    return _doGenericPayment(payment, PaymentType.CASH, paidAmount) ? payment : null;
  }

  bool _doGenericPayment(InvoicePaymentList paymentList, int paymentTypeId, double paidAmount) {
    double processed = 0;

    paymentList.paymentTypeID = paymentTypeId;

    if (paidAmt > paymentList.orderAmt) {
      switch (paymentTypeId) {
        case PaymentType.COMP:
        case PaymentType.GIFT_CARD:
        case PaymentType.MEMBERSHIP:
        case PaymentType.CUSTOM:
          paidAmt = paymentList.orderAmt;
          break;
      }
    }

    paymentList.serviceChargeAmt = min(paidAmount, paymentList.serviceChargeAmt);
    processed += paidAmount < paymentList.serviceChargeAmt ? paidAmount : paymentList.serviceChargeAmt;

    if (paidAmt >= processed) {
      paymentList.taxAmt = min(paidAmount - processed, paymentList.taxAmt);
      processed += paymentList.taxAmt;

      if (paidAmount >= processed) {
        paymentList.tipsAmt = min(paidAmount - processed, paymentList.tipsAmt);
      }
    }

    paymentList.paidAmt = paidAmount;
    return paidAmount > 0;
  }

  double updatePayment(double amountDue, double invoiceTotal) {
    if (!this.isDeposit && !this.isVoided) {
      this.orderAmt = amountDue;
    }

    if (this.paymentTypeID == PaymentType.COUPON) {
      this.paidAmt = this.isCouponRate ? (invoiceTotal * this.couponAmt).round().toDouble() : this.couponAmt;
    }

    return min(this.orderAmt, this.paidAmt);
  }
}

@JsonSerializable()
@HiveType(typeId: 26)
class PaymentListCreditCardTransactions {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String branchID;
  @HiveField(3)
  String paymentId;
  @HiveField(4)
  String invoiceId;
  @HiveField(5)
  int orderIndex;
  @HiveField(6)
  int staffId;
  @HiveField(7)
  int invoiceType;
  @HiveField(8)
  double saleAmount;
  @HiveField(9)
  double totalAmount;
  @HiveField(10)
  String authCode;
  @HiveField(11)
  String cardNum;
  @HiveField(12)
  String cardType;
  @HiveField(13)
  int cardTypeID;
  @HiveField(14)
  String ecrRefNum;
  @HiveField(15)
  String expDate;
  @HiveField(16)
  bool isBatchClosed = false;
  @HiveField(17)
  String nameOnCard;
  @HiveField(18)
  String refNum;
  @HiveField(19)
  String status;
  @HiveField(20)
  int statusID;
  @HiveField(21)
  double taxAmount;
  @HiveField(22)
  double tipAmount;
  @HiveField(23)
  String transactionTime;
  @HiveField(24)
  String signature;
  @HiveField(25)
  int creditTerminalType;
  @HiveField(26)
  String posName;
  @HiveField(27)
  String terminalIP;
  @HiveField(28)
  String terminalPort;
  @HiveField(29)
  int invoiceNumber;

  PaymentListCreditCardTransactions({
    this.id,
    this.companyID,
    this.branchID,
    this.paymentId,
    this.invoiceId,
    this.orderIndex,
    this.staffId,
    this.invoiceType,
    this.saleAmount,
    this.totalAmount,
    this.authCode,
    this.cardNum,
    this.cardType,
    this.ecrRefNum,
    this.expDate,
    this.isBatchClosed,
    this.nameOnCard,
    this.refNum,
    this.status,
    this.statusID,
    this.taxAmount,
    this.tipAmount,
    this.transactionTime,
    this.signature,
    this.creditTerminalType,
    this.posName,
    this.terminalIP,
    this.terminalPort,
    this.invoiceNumber
  });

  factory PaymentListCreditCardTransactions.fromJson(Map<String, dynamic> json) => _$PaymentListCreditCardTransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentListCreditCardTransactionsToJson(this);
}

class PaymentType {
  static const NONE = 0;
  static const CASH = 1;
  static const VOUCHER = 2;
  static const CREDIT_CARD = 3;
  static const CERTIFICATE = 4;
  static const GIFT_CARD = 5;
  static const COUPON = 6;
  static const COMP = 7;
  static const CUSTOM = 8;
  static const MEMBERSHIP = 9;
  static const WECHAT = 10;
  static const ALIPAY = 11;
  static const DEPOSIT = 99;
}

