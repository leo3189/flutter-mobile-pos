import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orderDetails_taxList.g.dart';

@JsonSerializable()
@HiveType(typeId: 17)
class OrderDetailsTaxList {
  @HiveField(0)
  String orderDetailsID;
  @HiveField(1)
  int taxID;
  @HiveField(2)
  String name;
  @HiveField(3)
  double taxRate;
  @HiveField(4)
  double amt;

  OrderDetailsTaxList({
    this.orderDetailsID,
    this.taxRate,
    this.taxID,
    this.name,
    this.amt
  });

  factory OrderDetailsTaxList.fromJson(Map<String, dynamic> json) => _$OrderDetailsTaxListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsTaxListToJson(this);

  void calculateAmount(double amount) {
    double rate = this.taxRate / 100;
    this.amt = amount * rate;
  }
}