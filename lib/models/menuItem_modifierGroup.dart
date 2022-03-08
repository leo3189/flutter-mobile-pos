import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/modifier_group.dart';

part 'menuItem_modifierGroup.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 5)
class MenuItemModifierGroup {
  @HiveField(0)
  int menuItemID;
  @HiveField(1)
  int modifierGroupID;
  @HiveField(2)
  int orderIndex;
  @HiveField(3)
  int parentMenuItemId;
  @HiveField(4)
  int parentModifierGroupId;
  @HiveField(5)
  bool isDeleted;

  @JsonKey(ignore: true)
  ModifierGroup modifierGroup;

  MenuItemModifierGroup(
    this.menuItemID,
    this.modifierGroupID,
    this.orderIndex,
    this.parentMenuItemId,
    this.parentModifierGroupId,
    this.isDeleted
  );

  factory MenuItemModifierGroup.fromJson(Map<String, dynamic> json) => _$MenuItemModifierGroupFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemModifierGroupToJson(this);
}