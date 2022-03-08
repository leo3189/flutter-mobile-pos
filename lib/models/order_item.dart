import 'package:flutter_mobile_pos/models/menu_item.dart';

class OrderItem {
  int itemId;
  String name;
  int quantity;
  String remark;
  int orderIndex;
  List<SelectedModification> selectedModification;
  SelectedVariant selectedVariant;
  double totalAmt;
  MenuItem itemInfo;

  OrderItem({
    this.itemId,
    this.name,
    this.quantity,
    this.remark,
    this.orderIndex,
    this.selectedModification,
    this.selectedVariant,
    this.totalAmt,
    this.itemInfo
  });
}

class SelectedModification {
  int modifierId;
  String name;
  int quantity;
  int orderIndex;
  double price;

  SelectedModification({
    this.modifierId,
    this.name,
    this.quantity,
    this.orderIndex,
    this.price
  });
}

class SelectedVariant {
  int variantId;
  String name;
  double price;

  SelectedVariant({
    this.variantId,
    this.name,
    this.price
  });
}