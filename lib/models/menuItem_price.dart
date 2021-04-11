import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menuItem_price.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class MenuItemPrice {
  @HiveField(0)
  int menuItemID;
  @HiveField(1)
  int orderTypeID;
  @HiveField(2)
  String variantIds;
  @HiveField(3)
  double designFee;
  @HiveField(4)
  int parentMenuItemId;
  @HiveField(5)
  int parentOrderTypeId;
  @HiveField(6)
  String parentVariantIds;
  @HiveField(7)
  bool isDefault;
  @HiveField(8)
  int orderIndex;
  @HiveField(9)
  double price;

  MenuItemPrice(
    this.menuItemID,
    this.orderTypeID,
    this.variantIds,
    this.designFee,
    this.parentMenuItemId,
    this.parentOrderTypeId,
    this.parentVariantIds,
    this.isDefault,
    this.orderIndex,
    this.price
  );

  factory MenuItemPrice.fromJson(Map<String, dynamic> json) => _$MenuItemPriceFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemPriceToJson(this);
}