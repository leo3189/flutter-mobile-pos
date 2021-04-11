import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orderDetails_promotionList.g.dart';

@JsonSerializable()
@HiveType(typeId: 20)
class OrderDetailsPromotionList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderDetailsID;
  @HiveField(2)
  int promotionID;
  @HiveField(3)
  String description;
  @HiveField(4)
  double amt;

  OrderDetailsPromotionList(
    this.id,
    this.orderDetailsID,
    this.promotionID,
    this.description,
    this.amt
  );

  factory OrderDetailsPromotionList.fromJson(Map<String, dynamic> json) => _$OrderDetailsPromotionListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsPromotionListToJson(this);
}