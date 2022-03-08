import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/variant_list.dart';

part 'orderDetails_variantList.g.dart';

@JsonSerializable()
@HiveType(typeId: 19)
class OrderDetailsVariantList {
  @HiveField(0)
  String orderDetailsID;
  @HiveField(1)
  int variantID;

  OrderDetailsVariantList({
    this.orderDetailsID,
    this.variantID
  });

  factory OrderDetailsVariantList.fromJson(Map<String, dynamic> json) => _$OrderDetailsVariantListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsVariantListToJson(this);

  @JsonKey(ignore: true)
  VariantList variant;

  OrderDetailsVariantList.init(String orderDetailId, VariantList variant) {
    this.variant = variant;
    this.variantID = variant.id;
    this.orderDetailsID = orderDetailId;
  }
}