import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menuItem_promotion.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class MenuItemPromotion {
  @HiveField(0)
  int promotionID;
  @HiveField(1)
  int menuItemID;
  @HiveField(2)
  int parentPromotionId;
  @HiveField(3)
  int parentMenuItemId;

  MenuItemPromotion(
    this.promotionID,
    this.menuItemID,
    this.parentPromotionId,
    this.parentMenuItemId
  );

  factory MenuItemPromotion.fromJson(Map<String, dynamic> json) => _$MenuItemPromotionFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemPromotionToJson(this);
}