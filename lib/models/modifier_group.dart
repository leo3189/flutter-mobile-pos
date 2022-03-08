import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/modifier_item.dart';
import 'package:flutter_mobile_pos/models/name_list.dart';

part 'modifier_group.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 13)
class ModifierGroup {
  @HiveField(0)
  int id;
  @HiveField(1)
  int parentId;
  @HiveField(2)
  String branchId;
  @HiveField(3)
  String companyID;
  @HiveField(4)
  int mixSelections;
  @HiveField(5)
  int maxSelections;
  @HiveField(6)
  String icon;
  @HiveField(7)
  bool isDisplayAmt;
  @HiveField(8)
  String unicode;
  @HiveField(9)
  bool isDeleted;
  @HiveField(10)
  bool isParent;
  @HiveField(11)
  bool isActicve;
  @HiveField(12)
  int orderIndex;
  @HiveField(13)
  String type;
  @HiveField(14)
  String color;
  @HiveField(15)
  bool isRequired;
  @HiveField(16)
  bool isSelfOrder;
  @HiveField(17)
  bool isOnlineOrder;
  @HiveField(18)
  List<NameList> nameList;
  @HiveField(19)
  List<ModifierItem> modifierItems;

  ModifierGroup(
    this.id,
    this.parentId,
    this.branchId,
    this.companyID,
    this.mixSelections,
    this.maxSelections,
    this.icon,
    this.isDisplayAmt,
    this.unicode,
    this.isDeleted,
    this.isParent,
    this.isActicve,
    this.orderIndex,
    this.type,
    this.color,
    this.isRequired,
    this.isSelfOrder,
    this.isOnlineOrder,
    this.nameList,
    this.modifierItems
  );

  factory ModifierGroup.fromJson(Map<String, dynamic> json) => _$ModifierGroupFromJson(json);
  Map<String, dynamic> toJson() => _$ModifierGroupToJson(this);
}