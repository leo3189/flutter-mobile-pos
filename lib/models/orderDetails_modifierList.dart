import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_mobile_pos/models/modifier_item.dart';

part 'orderDetails_modifierList.g.dart';

@JsonSerializable()
@HiveType(typeId: 18)
class OrderDetailsModifierList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderDetailsID;
  @HiveField(2)
  int modifierItemID;
  @HiveField(3)
  int menuItemQty = 0;
  @HiveField(4)
  int qty = 0;
  @HiveField(5)
  double totalAmt = 0;

  @JsonKey(ignore: true)
  ModifierItem modifierItem;

  OrderDetailsModifierList({
    this.id,
    this.orderDetailsID,
    this.modifierItemID,
    this.menuItemQty,
    this.qty,
    this.totalAmt
  });

  OrderDetailsModifierList.withModifierItem(String orderDetailId, int menuItemQty, int qty ,ModifierItem modifierItem ) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    this.orderDetailsID = orderDetailId;
    this.modifierItemID = modifierItem.id;
    this.menuItemQty = menuItemQty;
    this.qty = qty;
    this.totalAmt = modifierItem.price * qty;
    this.modifierItem = modifierItem;
  }

  factory OrderDetailsModifierList.fromJson(Map<String, dynamic> json) => _$OrderDetailsModifierListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsModifierListToJson(this);
}