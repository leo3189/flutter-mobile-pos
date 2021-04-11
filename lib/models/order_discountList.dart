import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_discountList.g.dart';

@JsonSerializable()
@HiveType(typeId: 14)
class OrderDiscountList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderID;
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

  OrderDiscountList(
    this.id,
    this.orderID,
    this.discountID,
    this.discountBy,
    this.name,
    this.rate,
    this.amt,
    this.isAmtDiscount
  );

  factory OrderDiscountList.fromJson(Map<String, dynamic> json) => _$OrderDiscountListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDiscountListToJson(this);
}