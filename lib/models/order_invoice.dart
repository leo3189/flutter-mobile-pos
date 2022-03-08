import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/helpers/database_helper.dart';
import 'package:flutter_mobile_pos/helpers/syncData_helper.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/order.dart';

part 'order_invoice.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 41)
class OrderInvoice {
  @HiveField(0)
  Order order;
  @HiveField(1)
  List<Invoice> invoices;
  @HiveField(2)
  bool isNewOrder;

  OrderInvoice({
    this.order,
    this.invoices,
    this.isNewOrder
  });

  factory OrderInvoice.fromJson(Map<String, dynamic> json) => _$OrderInvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$OrderInvoiceToJson(this);

  OrderInvoice.init(Order order, List<Invoice> invoices) {
    this.order = order;
    this.isNewOrder = order.seqNum < 1 ? true : false;

    invoices.forEach((e) {  
      e.orderSeqNum = order.seqNum;
      e.updateInvoiceNumToChild();
    });

    this.invoices = invoices;
    this.order.paidAmt = invoices.fold(0, (previousValue, element) => previousValue + element.paidAmt);
  }

  save() {
    //Loops through every invoice and attempts to charge GiftCard/Membership todo

    //Checks if deposit is paid and saves if valid
    if (this.invoices.length == 1 && this.invoices.first.depositAmt > 0 && this.invoices.first.status == InvoiceStatus.PAID) {
      // todo save database deposit invoicce
    }

    //todo save database orderInvoice
    _saveDatabase();

    return this.order.seqNum != 0;
  }

  Future<bool> _saveDatabase() async {
    try {
      await DatabaseHelper.instance.insertOrder(this.order.toJson());
    
      for (var invoice in this.invoices) {
        await DatabaseHelper.instance.insertInvoice(invoice);
      }

      SyncDataHelper.createSyncData(SyncDataAction.CREATE_INVOICE, jsonEncode(this.toJson()));

      return true;
    } catch (error) {
      return false;
    }
  }
}