import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/models/menu_item.dart';
import 'package:flutter_mobile_pos/models/modifier_item.dart';
import 'package:flutter_mobile_pos/models/orderDetails_modifierList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_discountList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_promotionList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_taxList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_variantList.dart';
import 'package:flutter_mobile_pos/models/variant_list.dart';

part 'order_detailList.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 15)
class OrderDetailsList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String orderID;
  @HiveField(3)
  String companyID;
  @HiveField(4)
  int menuItemID = 0;
  @HiveField(5)
  int seat;
  @HiveField(6)
  int addedBy = 0;
  @HiveField(7)
  String comment;
  @HiveField(8)
  double priceOverride;
  @HiveField(9)
  double price;
  @HiveField(10)
  double itemCost;
  @HiveField(11)
  int qty = 0;
  @HiveField(12)
  bool isOpenItem = false;
  @HiveField(13)
  double subtotalAmt;
  @HiveField(14)
  double totalAmt;
  @HiveField(15)
  double taxAmt;
  @HiveField(16)
  double totalDiscountAmt;
  @HiveField(17)
  bool isCakeOrder = false;
  @HiveField(18)
  bool isUsingDesignFee = false;
  @HiveField(19)
  double designFee;
  @HiveField(20)
  int menuCategoryId = 0;
  @HiveField(21)
  int menuGroupId = 0;
  @HiveField(22)
  int salesCategoryId = 0;
  @HiveField(23)
  double weight;
  @HiveField(24)
  int status = 0;
  @HiveField(25)
  List<OrderDetailsTaxList> taxList;
  @HiveField(26)
  List<OrderDetailsDiscountList> discountList;
  @HiveField(27)
  List<OrderDetailsModifierList> modifierList;
  @HiveField(28)
  List<OrderDetailsVariantList> variantList;
  @HiveField(29)
  List<OrderDetailsPromotionList> promotionList;

  OrderDetailsList({
    this.id,
    this.name,
    this.orderID,
    this.companyID,
    this.menuItemID,
    this.seat = 0,
    this.addedBy,
    this.comment,
    this.priceOverride,
    this.price,
    this.itemCost = 0.0,
    this.qty,
    this.isOpenItem = false,
    this.subtotalAmt,
    this.totalAmt,
    this.taxAmt,
    this.totalDiscountAmt = 0,
    this.isCakeOrder = false,
    this.isUsingDesignFee = false,
    this.designFee = 0,
    this.menuCategoryId,
    this.menuGroupId,
    this.salesCategoryId,
    this.weight = 0,
    this.status = 0,
    this.taxList,
    this.discountList,
    this.modifierList,
    this.variantList,
    this.promotionList
  });
  
  factory OrderDetailsList.fromJson(Map<String, dynamic> json) => _$OrderDetailsListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsListToJson(this);

  OrderDetailsList.origin(String orderId, int orderTypeId, MenuItem menuItem, {int menuGroupId, double weight = 0, bool includeModifiers = true}) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    allowRecalculation = true;
    this.companyID = SpHelper.getString('companyId');
    this.orderTypeId = orderTypeId;
    this.menuGroupId = menuGroupId;
    this.totalDiscountAmt = 0;
    this.comment = '';
    this.menuItem = menuItem;
    this.salesCategoryId = menuItem.salesCategoryID;
    this.price = menuItem.defaultPrice;
    this.qty = 1;
    this.subtotalAmt = price * qty;
    this.taxAmt = 0;
    this.totalAmt = subtotalAmt + taxAmt;
    this.addedBy = 0;
    this.orderID = orderId;
    this.weight = weight;
    this.promotionList = [];
    this.variantList = [];
    this.modifierList = [];
    this.discountList = [];
    this.taxList = [];
    this.itemCost = 0;
    this.name = menuItem.nameList[0].localName;
    this.menuItemID = menuItem.id;
    this.menuCategoryId = menuItem.menuCategoryID;
    this.isOpenItem = menuItem.isOpenItem;
    this.isUsingDesignFee = menuItem.isUsingDesignFee;
    this.weight = weight;
    this.seat = 0;
    this.priceOverride = 0;
    this.designFee = 0;

    for (var tax in this.menuItem.taxes) {
      OrderDetailsTaxList list = new OrderDetailsTaxList(
        orderDetailsID: this.id,
        taxRate: tax.tax.rate,
        taxID: tax.taxId,
        name: tax.tax.name,
      );
      this.taxList.add(list);
    }

    // for (var price in menuItem.priceList.where((w) => w.isDefault)) {
    //   if (this.menuItem.variantGroups.length > 0) {

    //   }
    // }

    if (includeModifiers) {

    }

    _maskAsNew();
    calculateTotals();
  }

  MenuItem _menuItem;
  MenuItem get menuItem => _menuItem;
  set menuItem(dynamic newItem) => _menuItem = newItem;

  bool _allowRecalculation;
  bool get allowRecalculation => _allowRecalculation;
  set allowRecalculation(dynamic value) {
    // assert(value != null);
    _allowRecalculation = value;
    if (value) calculateTotals();
  }

  int _orderTypeId;
  int get orderTypeId => _orderTypeId;
  set orderTypeId(dynamic id) => _orderTypeId = id;

  void calculateTotals({bool isTaxExempt = false}) {
    if (menuItem == null || !allowRecalculation) return;
    double totalPromotion = 0;
    double subtotal = this.price * (menuItem.useScale ? weight : 1) *qty;
    double totalDiscount = 0;

    if (menuItem != null) {
      //todo menu item inventory item and composition {}

      List<int> tempList = [];
      for (var vItem in variantList) {
        tempList.add(vItem.variantID);

        //todo menu item inventory item and composition {}
      }

      for (var pList in menuItem.priceList) {
        if (pList.variantIds.isNotEmpty) {
          List<int> ids = pList.variantIds.split(',').map((e) => int.parse(e)).toList();
          if (listEquals(tempList, ids) && tempList.length == ids.length) {
            subtotal = pList.price * (this.menuItem.useScale ? this.weight : 1) * this.qty;
            break;
          }
        }
      }
    }
    subtotal = (this.priceOverride == 0 ? subtotal : this.priceOverride * this.qty);
    this.subtotalAmt = subtotal;

    for (var modifier in this.modifierList) {
      subtotal += modifier.totalAmt * qty;
    }

    this.totalDiscountAmt = totalDiscount;
    this.subtotalAmt = subtotal;
    this.taxAmt = 0;

    for (var tax in this.taxList) {
      tax.calculateAmount(subtotal - this.totalDiscountAmt);
      this.taxAmt += tax.amt;
    }

    this.totalAmt = this.taxAmt + subtotalAmt - this.totalDiscountAmt;
  }

  bool toggleVariant(VariantList variant) {
    if (variant != null) {
      if (!variant.isDeleted || this.menuItem.variantGroups.firstWhere((f) => f.variantGroupID == variant.variantGroupID, orElse: () => null) != null) {
        if (!_hasVariant(variant)) {
          List<OrderDetailsVariantList> list = [];
          for (var v in this.variantList) {
            if (v.variant.variantGroupID != variant.variantGroupID) {
              list.add(v);
            }
          }
          this.variantList = [ OrderDetailsVariantList.init(this.id, variant) ];
        }
        calculateTotals();
        return true;
      }
    }
    return false;
  }

  bool _hasVariant(VariantList variant) {
    return this.variantList.any((a) => a.variantID == variant.id);
  }

  OrderDetailsModifierList toggleModifierItem(ModifierItem modifierItem) {
    var group = this.menuItem.modifierGroups.singleWhere((s) => s.modifierGroupID == modifierItem.modifierGroupID,  orElse: () => null);

    // if (modifierItem.isDeleted  || group == null) return null;
    if ( group == null) return null;

    OrderDetailsModifierList addedModifier;
    var existedModifier = this.modifierList.firstWhere(((f) => f.modifierItemID == modifierItem.id), orElse: () => null);
    print('existed modifier: $existedModifier');

    if (existedModifier == null) {
      var existedDetails = getOrderDetailsModifierList(group.modifierGroupID);

      OrderDetailsModifierList list = new OrderDetailsModifierList.withModifierItem(this.id, this.qty, 1, modifierItem);

      if (group.modifierGroup.maxSelections == 1 && group.modifierGroup.maxSelections == existedDetails.length) {
        var x = existedDetails.first;
        this.modifierList.remove(x);
        existedDetails = getOrderDetailsModifierList(group.modifierGroupID);
      }

      if (group.modifierGroup.maxSelections < 1 || group.modifierGroup.maxSelections > existedDetails.length) {
        if (group.modifierGroup.type == '0') this.modifierList.insert(0, list);
        else this.modifierList.add(list);
        _maskAsModifier();
        addedModifier = list;
      }
    } else {
      this.modifierList.remove(existedModifier);
      _maskAsModifier();
    }
    calculateTotals();
    return addedModifier;
  }

  List<OrderDetailsModifierList> getOrderDetailsModifierList(int modifierGroupId) {
    return this.modifierList.where((w) => w.modifierItem.modifierGroupID == modifierGroupId).toList();
  }

  void _maskAsModifier() {
    if (this.status == OrderDetailStatus.SENT && !canDelete()) this.status = OrderDetailStatus.MODIFIED;
  }

  void _maskAsNew() {
    this.status = OrderDetailStatus.NEW;
    if (this.menuItem.printers.length < 1) this.status = OrderDetailStatus.NO_PRINTER;
  }

  bool canDelete() {
    return this.status == OrderDetailStatus.NEW || this.status == OrderDetailStatus.NO_PRINTER;
  }

  void modifierItemSetQty(ModifierItem item, int amt) {
    var modifier = this.modifierList.singleWhere((s) => s.modifierItemID == item.id, orElse: null);

    if (modifier != null && (!item.isMandatory || amt > 0)) {
      var max = item.modifierGroup.maxSelections;
      var current = getModifierDetailsInGroup(item.modifierGroupID).where((w) => w.modifierItemID != item.id).length;
      modifier.qty = max < 1 ? amt : min(amt, max - current);
      _maskAsModifier();
      if (modifier.qty < 1) toggleModifierItem(item);
      else calculateTotals();
    }
  }

  List<OrderDetailsModifierList> getModifierDetailsInGroup(int modifierGroupId) {
    return this.modifierList.where((w) => w.modifierItem.modifierGroupID == modifierGroupId).toList();
  }
}

class OrderDetailStatus {
  static const NEW = 0;
  static const SENT = 1;
  static const MODIFIED = 2;
  static const DELETED = 3;
  static const DELETED_SENT = 4;
  static const NO_PRINTER = 5;
}