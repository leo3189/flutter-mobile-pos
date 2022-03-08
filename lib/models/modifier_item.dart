import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/modifier_group.dart';
import 'package:flutter_mobile_pos/models/name_list.dart';

part 'modifier_item.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 12)
class ModifierItem {
  @HiveField(0)
  int id;
  @HiveField(1)
  String branchId;
  @HiveField(2)
  int modifierGroupID;
  @HiveField(3)
  double price;
  @HiveField(4)
  double price2;
  @HiveField(5)
  bool isMandatory;
  @HiveField(6)
  bool isDefault;
  @HiveField(7)
  bool enabled;
  @HiveField(8)
  bool isDeleted;
  @HiveField(9)
  int orderIndex;
  @HiveField(10)
  bool isParent;
  @HiveField(11)
  int parentId;
  @HiveField(12)
  bool noteRequired;
  @HiveField(13)
  bool isOnlineOrder;
  @HiveField(14)
  int imageID;
  @HiveField(15)
  List<NameList> nameList;

  @JsonKey(ignore: true)
  ModifierGroup modifierGroup;

  ModifierItem(
    this.id,
    this.branchId,
    this.modifierGroupID,
    this.price,
    this.price2,
    this.isMandatory,
    this.isDefault,
    this.enabled,
    this.isDeleted,
    this.orderIndex,
    this.isParent,
    this.parentId,
    this.noteRequired,
    this.isOnlineOrder,
    this.imageID,
    this.nameList
  );

  factory ModifierItem.fromJson(Map<String, dynamic> json) => _$ModifierItemFromJson(json);
  Map<String, dynamic> toJson() => _$ModifierItemToJson(this);
}