import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orderDetails_discountList.g.dart';

@JsonSerializable()
@HiveType(typeId: 23)
class OrderDetailsDiscountList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderDetailsID;
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

  OrderDetailsDiscountList(
    this.id,
    this.orderDetailsID,
    this.discountID,
    this.discountBy,
    this.name,
    this.rate,
    this.amt,
    this.isAmtDiscount
  );

  factory OrderDetailsDiscountList.fromJson(Map<String, dynamic> json) => _$OrderDetailsDiscountListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsDiscountListToJson(this);
}