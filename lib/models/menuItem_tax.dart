import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/taxes.dart';

part 'menuItem_tax.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class MenuItemTax {
  @HiveField(0)
  int menuItemId;
  @HiveField(1)
  int taxId;
  @HiveField(2)
  int parentMenuItemId;
  @HiveField(3)
  int parentTaxId;
  @HiveField(4)
  bool isDeleted;

  @JsonKey(ignore: true)
  Taxes tax;

  MenuItemTax(
    this.menuItemId,
    this.taxId,
    this.parentMenuItemId,
    this.parentTaxId,
    this.isDeleted,
  );
  
  factory MenuItemTax.fromJson(Map<String, dynamic> json) => _$MenuItemTaxFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemTaxToJson(this);
}