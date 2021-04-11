import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_taxList.g.dart';

@JsonSerializable()
@HiveType(typeId: 22)
class OrderTaxList {
  @HiveField(0)
  String orderID;
  @HiveField(1)
  int taxID;
  @HiveField(2)
  String name;
  @HiveField(3)
  double taxRate;
  @HiveField(4)
  double amt;

  OrderTaxList({
    this.orderID,
    this.taxID,
    this.name,
    this.taxRate,
    this.amt
  });

  factory OrderTaxList.fromJson(Map<String, dynamic> json) => _$OrderTaxListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderTaxListToJson(this);
}