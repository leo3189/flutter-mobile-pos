import 'dart:math';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/models/invoice_detailList.dart';
import 'package:flutter_mobile_pos/models/invoice_paymentList.dart';
import 'package:flutter_mobile_pos/models/order.dart';
import 'package:flutter_mobile_pos/models/staff.dart';

part 'invoice.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 33)
class Invoice {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String branchID;
  @HiveField(3)
  String orderID;
  @HiveField(4)
  int numOfGuest;
  @HiveField(5)
  int orderSeqNum;
  @HiveField(6)
  int invoiceNum;
  @HiveField(7)
  String invoiceTime;
  @HiveField(8)
  String closeTime;
  @HiveField(9)
  int status;
  @HiveField(10)
  int orderBy;
  @HiveField(11)
  int createdBy;
  @HiveField(12)
  int voidedBy;
  @HiveField(13)
  String customerID;
  @HiveField(14)
  double tipsAmt;
  @HiveField(15)
  double serviceChargeAmt = 0;
  @HiveField(16)
  double totalTaxAmt;
  @HiveField(17)
  double totalDiscountAmt = 0;
  @HiveField(18)
  double orderDiscountAmt = 0;
  @HiveField(19)
  double subTotalAmt;
  @HiveField(20)
  double totalAmt;
  @HiveField(21)
  double totalCost = 0;
  @HiveField(22)
  double paidAmt = 0;
  @HiveField(23)
  double changeAmt = 0;
  @HiveField(24)
  double depositAmt = 0;
  @HiveField(25)
  double balanceAmt = 0;
  @HiveField(26)
  double deliveryFee = 0;
  @HiveField(27)
  bool isLastCheck = false;
  @HiveField(28)
  int orderTypeID = 0;
  @HiveField(29)
  String terminal;
  @HiveField(30)
  bool isReprint = false;
  @HiveField(31)
  int printedCount = 0;
  @HiveField(32)
  String pickupLocation;
  @HiveField(33)
  String toGoTime;
  @HiveField(34)
  bool isCakeOrder = false;
  @HiveField(35)
  String customerPhone;
  @HiveField(36)
  String customerAddress;
  @HiveField(37)
  String customerName;
  @HiveField(38)
  String tableID;
  @HiveField(39)
  String tableName;
  @HiveField(40)
  int splitTotal = 0;
  @HiveField(41)
  int splitIndex = 0;
  @HiveField(42)
  int splitType = 0;
  @HiveField(43)
  List<InvoicePaymentList> paymentList = [];
  @HiveField(44)
  List<InvoiceDetailsList> detailsList = [];
  @HiveField(45)
  List<InvoiceDiscountList> discountList = [];
  @HiveField(46)
  List<InvoiceTaxList> taxList = [];
  @HiveField(47)
  String note;

  Invoice({
    this.id,
    this.companyID,
    this.branchID,
    this.orderID,
    this.numOfGuest,
    this.orderSeqNum,
    this.invoiceNum,
    this.invoiceTime,
    this.closeTime,
    this.status,
    this.orderBy,
    this.createdBy,
    this.voidedBy,
    this.customerID,
    this.tipsAmt,
    this.serviceChargeAmt,
    this.totalTaxAmt,
    this.totalDiscountAmt,
    this.orderDiscountAmt,
    this.subTotalAmt,
    this.totalAmt,
    this.totalCost,
    this.paidAmt,
    this.changeAmt,
    this.depositAmt,
    this.balanceAmt,
    this.deliveryFee,
    this.isLastCheck,
    this.orderTypeID,
    this.terminal,
    this.isReprint,
    this.printedCount,
    this.pickupLocation,
    this.toGoTime,
    this.isCakeOrder,
    this.customerPhone,
    this.customerAddress,
    this.customerName,
    this.tableID,
    this.tableName,
    this.splitTotal,
    this.splitIndex,
    this.splitType,
    this.paymentList,
    this.detailsList,
    this.discountList,
    this.taxList,
    this.note
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);

  double _serviceChargePercentage;
  double get serviceChargePercentage => _serviceChargePercentage;
  set serviceChargePercentage(dynamic value) => _serviceChargePercentage = value;

  Staff get staff => SpHelper.getObj('staff', (v) => Staff.fromJson(v));

  Invoice.init(Order order) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    this.createdBy = staff.id;
    this.detailsList = [];
    this.paymentList = [];
    this.serviceChargePercentage = order.serviceChargePercentage;
    this.companyID = SpHelper.getString('companyId');
    this.branchID = SpHelper.getString('branchId');
    this.terminal = order.terminal;
    this.orderID = order.id;
    this.orderBy = order.createdBy;
    this.orderTypeID = order.orderTypeID;
    this.orderSeqNum = order.seqNum;
    //to do invoice num to count print and split
    this.invoiceNum = order.seqNum;
    this.status = InvoiceStatus.OPEN;
    this.isLastCheck = false;
    this.invoiceTime = DateTime.now().toString();
    this.createdBy = staff.id;
    this.customerID = order.customerID;
    this.tipsAmt = order.tipsAmt;
    this.serviceChargeAmt = order.serviceChargeAmt;
    this.serviceChargePercentage = order.serviceChargePercentage;
    this.subTotalAmt = order.subtotalAmt;
    this.totalAmt = order.totalAmt;
    this.totalDiscountAmt = order.totalDiscountAmt;
    this.depositAmt = order.depositAmt;
    this.paidAmt = order.paidAmt;
    this.changeAmt = order.changeAmt;
    this.deliveryFee = order.deliveryFee;
    this.totalCost = order.totalCost;
    this.customerAddress = order.customerAddress;
    this.customerName = order.customerName;
    this.customerPhone = order.customerPhone;
    this.toGoTime = order.toGoTime;
    this.pickupLocation = order.pickupLocation;
    this.note = order.note;
    this.numOfGuest = order.numOfGuest;
    this.tableID = order.tableID;
    this.tableName = order.tableName;
    for (var tax in order.taxList) {
      InvoiceTaxList list = new InvoiceTaxList(
        invoiceID: this.id,
        id: Uuid().v1().toString().replaceAll('-', ''),
        taxID: tax.taxID,
        name: tax.name,
        taxRate: tax.taxRate,
        amt: tax.amt
      );
      this.taxList.add(list);
    }

    for (var detail in order.getNonDeletedDetails()) {
      InvoiceDetailsList list = new InvoiceDetailsList.init(
        orderDetails: detail,
        invoiceId: this.id,
        invoiceTime: this.invoiceTime
      );
      this.detailsList.add(list);
    }

    for (var discount in order.discountList) {
      InvoiceDiscountList list = new InvoiceDiscountList(
        id: Uuid().v1().toString().replaceAll('-', ''),
        invoiceID: this.id,
        discountID: discount.discountID,
        discountBy: discount.discountBy,
        name: discount.name,
        rate: discount.rate,
        amt: discount.amt,
        isAmtDiscount: discount.isAmtDiscount
      );
      this.discountList.add(list);
    }

    this.balanceAmt = this.totalAmt;
  }

  InvoicePaymentList makePayment(int paymentTypeId, double amt) {
    InvoicePaymentList payment;

    if (amt > 0 && this.status != InvoiceStatus.PAID) {
      if (paymentTypeId == PaymentType.CASH) payment = InvoicePaymentList.withInvoice(this).makeCashPayment(amt);
      if (payment != null) this.paymentList.add(payment);
    }

    calculatePaymentTotals();
    return payment;
  }

  void calculatePaymentTotals() {
    this.changeAmt = 0;
    this.paidAmt = 0;
    this.balanceAmt = 0;
    this.tipsAmt = max(this.tipsAmt, _getTipsAmount());

    if (this.splitIndex != InvoiceSplitType.CUSTOM) {
      this.totalAmt = this.subTotalAmt - this.orderDiscountAmt + this.totalTaxAmt + this.serviceChargeAmt + this.tipsAmt;
    }

    double amountDue = (this.status == InvoiceStatus.OPEN && this.depositAmt > 0) ? this.depositAmt : this.totalAmt;
    double noChangeAmount = 0;
    double balanceAdjust = 0;

    for (var p in this.paymentList) {
      if (!p.isVoided) {
        p.updatePayment(this.totalAmt - this.paidAmt, this.totalAmt);
        if (p.paymentTypeID != PaymentType.NONE) this.paidAmt += p.paidAmt;
        if (p.paymentTypeID == PaymentType.CERTIFICATE || p.paymentTypeID == PaymentType.VOUCHER || p.paymentTypeID == PaymentType.COUPON) {
          noChangeAmount += p.paidAmt;
        }
      }
    }

    if (this.paidAmt >= amountDue) {
      this.changeAmt = this.paidAmt - amountDue;

      if (noChangeAmount > amountDue) {
        this.changeAmt -= (noChangeAmount - amountDue);
        balanceAdjust = noChangeAmount - amountDue;
      }
    }

    this.balanceAmt = this.totalAmt - this.paidAmt - this.changeAmt + balanceAdjust;
    if (this.balanceAmt < _getTipsRemaining()) this.balanceAmt = _getTipsRemaining();
    _finalizeInvoiceStatus();
  }

  double _getTipsAmount() {
    return this.paymentList.where((w) => !w.isVoided).fold(0, (previousValue, element) => previousValue + element.tipsAmt);
  }
  
  double _getTipsRemaining() {
    return this.tipsAmt - this.paymentList.where((w) => !w.isVoided).fold(0, (previousValue, element) => previousValue + element.tipsAmt);
  }

  void _finalizeInvoiceStatus() {
    if (this.depositAmt > 0 && this.depositAmt <= (this.paidAmt - this.changeAmt) && this.status == InvoiceStatus.OPEN) {
      for (var p in this.paymentList) {
        p.isDeposit = true;
      }
      this.status = InvoiceStatus.DEPOSIT;
    } else if (getAmountDue() <= 0) {
      this.status = InvoiceStatus.PAID;
    } else {
      this.status = InvoiceStatus.OPEN;
    }
  }

  double getAmountDue() {
    return (this.depositAmt > 0 && this.status == InvoiceStatus.OPEN) ? this.depositAmt - this.paidAmt : this.balanceAmt;
  }

  void updateInvoiceNumToChild() {
    if (this.paymentList != null) {
      for (var p in this.paymentList) {
        for (var c in p.creditCardTransactions) {
          c.invoiceNumber = this.invoiceNum;
        }
      }
    }
  }

  bool saveInvoice() {
    calculateTotals();
    if (this.orderSeqNum > 0) {
      //todo update invoice;
      return true;
    }
    return false;
  }

  void calculateTotals({bool force = false}) {
    if (this.splitType != InvoiceSplitType.NONE) {
      if (!force) return;
    }
    if (this.splitType == InvoiceSplitType.CUSTOM) return;

    double tempSubtotalAmount = 0;
    double tempTotalDiscountAmount = 0;
    if (this.splitType == InvoiceSplitType.NONE || this.splitType == InvoiceSplitType.ITEM) {
      for (var detail in this.detailsList) {
       detail.calculateTotals();
       tempSubtotalAmount += detail.subTotalAmt - detail.totalDiscountAmt;
       tempTotalDiscountAmount += detail.totalDiscountAmt;
      }
    } else {
      tempSubtotalAmount = this.subTotalAmt;
      tempTotalDiscountAmount = this.detailsList.fold(0, (previousValue, element) => previousValue + element.totalDiscountAmt);
    }

    double tempOrderDiscount = 0;

    for (var discount in this.discountList) {
      if (!discount.isAmtDiscount) {
        discount.amt = (discount.rate * tempSubtotalAmount);
      }
      tempOrderDiscount += discount.amt;
    }

    if (tempOrderDiscount > tempSubtotalAmount) {
      tempOrderDiscount = tempSubtotalAmount;
    }

    this.orderDiscountAmt = tempOrderDiscount;
    tempTotalDiscountAmount += this.orderDiscountAmt;

    this.subTotalAmt = tempSubtotalAmount;

    this.totalDiscountAmt = tempTotalDiscountAmount;

    for (var tax in this.taxList) {
      // var taxList = this.detailsList
    }

    this.totalTaxAmt = this.taxList.fold(0, (previousValue, element) => previousValue + element.amt);
    this.serviceChargeAmt = (this.serviceChargePercentage * (this.subTotalAmt - this.orderDiscountAmt));

    this.totalAmt = tempSubtotalAmount - this.orderDiscountAmt + this.totalTaxAmt + this.serviceChargeAmt + this.tipsAmt;
    this.balanceAmt = this.totalAmt - (this.paidAmt - this.changeAmt);
  }
  
}

@JsonSerializable()
@HiveType(typeId: 34)
class InvoiceDiscountList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceID;
  @HiveField(2)
  int discountID;
  @HiveField(3)
  int discountBy;
  @HiveField(4)
  String name;
  @HiveField(5)
  double rate;
  @HiveField(6)
  double amt;
  @HiveField(7)
  bool isAmtDiscount;

  InvoiceDiscountList({
    this.id,
    this.invoiceID,
    this.discountID,
    this.discountBy,
    this.name,
    this.rate,
    this.amt,
    this.isAmtDiscount
  });

  factory InvoiceDiscountList.fromJson(Map<String, dynamic> json) => _$InvoiceDiscountListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDiscountListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 24)
class InvoiceTaxList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceID;
  @HiveField(2)
  int taxID;
  @HiveField(3)
  String name;
  @HiveField(4)
  double taxRate;
  @HiveField(5)
  double amt;

  InvoiceTaxList({
    this.id,
    this.invoiceID,
    this.taxID,
    this.name,
    this.taxRate,
    this.amt
  });

  factory InvoiceTaxList.fromJson(Map<String, dynamic> json) => _$InvoiceTaxListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceTaxListToJson(this);
}

class InvoiceStatus {
  static const PAID = 1;
  static const VOID = 2;
  static const OPEN = 3;
  static const PARTIAL_VOID = 4;
  static const AFTER_DEPOSIT = 5;
  static const DEPOSIT = 6;
}

class InvoiceSplitType {
  static const NONE = 0;
  static const EVENLY = 1;
  static const ITEM = 2;
  static const SEAT = 3;
  static const CUSTOM = 4;
}