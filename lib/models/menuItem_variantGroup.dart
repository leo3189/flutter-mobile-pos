import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menuItem_variantGroup.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class MenuItemVariantGroup {
  @HiveField(0)
  int menuItemID;
  @HiveField(1)
  int variantGroupID;
  @HiveField(2)
  int orderIndex;
  @HiveField(3)
  int parentMenuItemId;
  @HiveField(4)
  int parentVariantGroupId;
  @HiveField(5)
  bool isDeleted;

  MenuItemVariantGroup(
    this.menuItemID,
    this.variantGroupID,
    this.orderIndex,
    this.parentMenuItemId,
    this.parentVariantGroupId,
    this.isDeleted
  );

  factory MenuItemVariantGroup.fromJson(Map<String, dynamic> json) => _$MenuItemVariantGroupFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemVariantGroupToJson(this);
}