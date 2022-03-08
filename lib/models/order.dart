import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_mobile_pos/helpers/database_helper.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/helpers/syncData_helper.dart';
import 'package:flutter_mobile_pos/models/daily_seq.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/menu_item.dart';
import 'package:flutter_mobile_pos/models/orderDetails_taxList.dart';
import 'package:flutter_mobile_pos/models/order_detailList.dart';
import 'package:flutter_mobile_pos/models/order_discountList.dart';
import 'package:flutter_mobile_pos/models/order_taxList.dart';
import 'package:flutter_mobile_pos/models/staff.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 16)
class Order {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String branchID;
  @HiveField(3)
  int orderTypeID = 0;
  @HiveField(4)
  int numOfGuest = 0;
  @HiveField(5)
  int createdBy = 0;
  @HiveField(6)
  String customerID;
  @HiveField(7)
  String checkInTime;
  @HiveField(8)
  String toGoTime;
  @HiveField(9)
  double tipsPercentage = 0;
  @HiveField(10)
  double serviceChargePercentage = 0;
  @HiveField(11)
  double tipsAmt = 0;
  @HiveField(12)
  double serviceChargeAmt = 0;
  @HiveField(13)
  double deliveryFee = 0;
  @HiveField(14)
  int orderStatus = 0;
  @HiveField(15)
  double subtotalAmt = 0;
  @HiveField(16)
  double totalAmt = 0;
  @HiveField(17)
  double totalCost = 0;
  @HiveField(18)
  double paidAmt = 0;
  @HiveField(19)
  double changeAmt = 0;
  @HiveField(20)
  double totalTaxAmt = 0;
  @HiveField(21)
  double totalDiscountAmt = 0;
  @HiveField(22)
  double orderDiscountAmt = 0;
  @HiveField(23)
  bool isCakeOrder = false;
  @HiveField(24)
  String pickupLocation;
  @HiveField(25)
  String note;
  @HiveField(26)
  String terminal;
  @HiveField(27)
  String customerPhone;
  @HiveField(28)
  String customerAddress;
  @HiveField(29)
  String customerName;
  @HiveField(30)
  String customerEmail;
  @HiveField(31)
  String tableID;
  @HiveField(32)
  String tableName;
  @HiveField(33)
  int seqNum;
  @HiveField(34)
  List<OrderTaxList> taxList = [];
  @HiveField(35)
  List<OrderDiscountList> discountList;
  @HiveField(36)
  List<OrderDetailsList> detailsList;
  @HiveField(37)
  bool isReprint = false;
  @HiveField(38)
  int completedBy;
  @HiveField(39)
  double depositAmt = 0;

  String taxId;

  Order({
    this.id,
    this.companyID,
    this.branchID,
    this.orderTypeID,
    this.numOfGuest = 1,
    this.createdBy,
    this.customerID,
    this.checkInTime,
    this.changeAmt = 0,
    this.toGoTime,
    this.tipsPercentage = 0,
    this.serviceChargePercentage = 0,
    this.tipsAmt = 0,
    this.serviceChargeAmt = 0,
    this.deliveryFee = 0,
    this.orderStatus,
    this.subtotalAmt = 0,
    this.totalAmt = 0,
    this.totalCost = 0,
    this.totalTaxAmt = 0,
    this.totalDiscountAmt = 0,
    this.orderDiscountAmt= 0,
    this.isCakeOrder = false,
    this.pickupLocation,
    this.note,
    this.terminal,
    this.customerPhone,
    this.customerAddress,
    this.customerEmail,
    this.tableID,
    this.tableName,
    this.seqNum,
    this.taxList,
    this.discountList,
    this.detailsList,
    this.paidAmt,
    this.customerName,
    this.isReprint,
    this.completedBy,
    this.depositAmt
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  bool _taxExempt;
  bool get taxExempt => _taxExempt;
  set taxExempt(dynamic value) => _taxExempt = value;

  Staff get staff => SpHelper.getObj('staff', (v) => Staff.fromJson(v));

  Order.origin({int orderType, int guest}) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    this.orderTypeID = orderType;
    this.numOfGuest = guest;
    this.orderStatus = OrderStatus.OPEN;
    this.companyID = SpHelper.getString('companyId');
    this.branchID = SpHelper.getString('branchId');
    this.pickupLocation = SpHelper.getString('branchId');
    this.terminal = '1';
    this.createdBy = 0;
    this.discountList = [];
    this.detailsList = [];
    this.seqNum = 0;
  }

  void calculateTotals() {
    if (orderStatus != OrderStatus.CLOSED && orderStatus != OrderStatus.VOID) {
      double tempSubtotal = 0;
      double tempTotalTax = 0;
      double tempTotal = 0;
      double tempTotalDiscount = 0;
      totalCost = 0;
      taxList.clear();

      var allDetails = getNonDeletedDetails();
      for (var d in allDetails) d.calculateTotals();
      tempSubtotal = allDetails.fold(0, (previousValue, element) => previousValue + (element.subtotalAmt - element.totalDiscountAmt));
      tempTotalDiscount = allDetails.fold(0, (previousValue, element) => previousValue + element.totalDiscountAmt);
      tempTotalTax = allDetails.fold(0, (previousValue, element) => previousValue + element.taxAmt);
      totalCost = allDetails.fold(0, (previousValue, element) => previousValue + element.itemCost);

      double tempOrderDiscount = 0;
      for (var discount in discountList) {
        if (!discount.isAmtDiscount) {
          discount.amt = discount.rate * tempSubtotal;
        }
        tempOrderDiscount += discount.amt;
      }

      if (tempOrderDiscount > tempSubtotal) {
        tempOrderDiscount = tempSubtotal;
      }

      this.orderDiscountAmt = tempOrderDiscount;
      tempTotalDiscount += this.orderDiscountAmt;

      this.subtotalAmt = tempSubtotal;

      this.totalDiscountAmt = tempTotalDiscount;

      List<OrderTaxList> tempTaxList = _getOrderTaxList();
      this.totalTaxAmt = tempTaxList.fold(0, (previousValue, element) => previousValue + element.amt);

      this.totalAmt = tempSubtotal - this.orderDiscountAmt + this.totalTaxAmt + this.serviceChargeAmt + this.tipsAmt;
    }
  }
  
  List<OrderTaxList> _getOrderTaxList()  {
    List<OrderDetailsTaxList> itemTaxList = [];
    for (var detail in this.detailsList) {
      for (var tax in detail.taxList) {
        itemTaxList.add(tax);
      }
    }

    for (var tax in itemTaxList) {
      var find = this.taxList.where((w) => w.taxID == tax.taxID).toList();
      if (find.length == 0) {
        OrderTaxList list = new OrderTaxList(
          orderID: this.id,
          taxID: tax.taxID,
          taxRate: tax.taxRate,
          amt: tax.amt,
          name: tax.name
        );
        this.taxList.add(list);
      } else {
        var index = this.taxList.indexWhere((i) => i.taxID == tax.taxID);
        this.taxList[index].amt += tax.amt;
      }
    }
    return this.taxList;
  }

  List<OrderDetailsList> getNonDeletedDetails() {
    return this.detailsList.where((w) => w.qty > 0 && w.status != OrderDetailStatus.DELETED && w.status != OrderDetailStatus.DELETED_SENT).toList();
  }

  OrderDetailsList createOrderDetailList(MenuItem menuItem, {int menuGroupId, double weight = 0}) {
    OrderDetailsList orderDetail;

    if (menuItem != null) {
      if (this.detailsList.length < 1) checkInTime = DateTime.now().toString();

      if (menuItem.isUsingPickUpDate && toGoTime == null) toGoTime = DateTime.now().add(Duration(days: 1)).toString();

      orderDetail = new OrderDetailsList.origin(this.id, this.orderTypeID, menuItem, menuGroupId: menuGroupId);
      this.detailsList.add(orderDetail);
      calculateTotals();
    }
    return orderDetail;
  }

  Future<bool> saveOrder({bool isNew = false}) async {
    calculateTotals();

    if (isNew || this.seqNum > 0) {
      //todo update exists order
      await DatabaseHelper.instance.insertOrder(this.toJson());
      return true;
    } else {
      this.seqNum = await getDailySeq();
      var response = await DatabaseHelper.instance.insertOrder(this.toJson());
      if (response) SyncDataHelper.createSyncData(SyncDataAction.CREATE_ORDER, jsonEncode(this.toJson()));
      return this.seqNum != 0;
    }
  }

   Future<int> getDailySeq() async {
    var startNum = 1;
    var dailySeq = await DatabaseHelper.instance.getDailySeq();
    var seq = 0;
    if (dailySeq.length <= 0) {
      seq = startNum;
    } else if (dailySeq[0].lastUpdate.day.compareTo(DateTime.now().day) < 0) {
      seq = startNum;
    } else {
      seq = dailySeq[0].seqNum + 1;
    }

    DailySeq daily = new DailySeq(
      seqNum: seq,
      lastUpdate: DateTime.now() 
    );
    await DatabaseHelper.instance.insertDailySeq(daily.toJson());
    return seq;
  }

  bool closeOrder(List<Invoice> invoiceList) {
    this.isReprint = true;
    double tempTaxAmount = 0;
    double totalAmount = 0;
    this.completedBy = staff.id;
    this.paidAmt = 0;
    this.changeAmt = 0;
    this.tipsAmt = 0;
    this.depositAmt = 0;

    this.discountList.clear();

    this.taxId = '';

    for (var invoice in invoiceList) {
      totalAmt += invoice.totalAmt;
      this.paidAmt += invoice.paidAmt;
      this.changeAmt += invoice.changeAmt;
      this.tipsAmt += invoice.tipsAmt;
      tempTaxAmount += invoice.totalTaxAmt;
      this.depositAmt += invoice.depositAmt;

      for (var discount in invoice.discountList) {
        OrderDiscountList list = new OrderDiscountList(
          Uuid().v1().toString().replaceAll('-', ''), 
          this.id, 
          discount.discountID, 
          discount.discountBy, 
          discount.name, 
          discount.rate, 
          discount.amt,
          true
        );
        this.discountList.add(list);
      }
    }

    for (OrderDetailsList orderDetail in this.detailsList) {
      orderDetail.calculateTotals();
    }

    calculateTotals();

    // if (invoiceList.firstWhere((f) => f.status == InvoiceStatus.DEPOSIT) == null) this.orderStatus = OrderStatus.CLOSED;
    if (invoiceList.where((f) => f.status == InvoiceStatus.DEPOSIT).toList().length == 0) this.orderStatus = OrderStatus.CLOSED;

    if ((this.totalAmt - totalAmt).abs() < 0.01) {
      return true;
    } else if (invoiceList.length > 1) {
      return true;
    } else {
      return false;
    }
  }
}

class OrderStatus {
  static const OPEN = 1;
  static const CLOSED = 2;
  static const VOID = 3;
  static const PARTIAL_VOID = 4;
  static const ALL = 0;
}

class OrderType {
  static const DELIVERY = 1;
  static const PICKUP = 2;
  static const TOGO = 3;
  static const BAR = 4;
  static const DINE_IN = 5;
  static const STAY = 5;
  static const ALL = 0;
  static const ONLINE = 6;

  static fromId(int id) {
    switch (id) {
      case DELIVERY: return 'Delivery';
      case PICKUP: return 'Pick Up';
      case TOGO: return 'To Go';
      case BAR: return 'Bar';
      case DINE_IN: return 'Dine In';
      case STAY: return 'Stay';
      case ONLINE: return 'Online';
    }
  }
}