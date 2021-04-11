import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xpress_mobile_pos/models/name_list.dart';

part 'menu_category.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 4)
class MenuCategory {
  @HiveField(0)
  int id;
  @HiveField(1)
  int parentId;
  @HiveField(2)
  bool isParent;
  @HiveField(3)
  String companyID;
  @HiveField(4)
  String branchID;
  @HiveField(5)
  int salesCategoryID;
  @HiveField(6)
  String icon;
  @HiveField(7)
  String colorCode;
  @HiveField(8)
  bool active;
  @HiveField(9)
  bool isUsingSchedule;
  @HiveField(10)
  bool onlineVisible;
  @HiveField(11)
  bool localVisible;
  @HiveField(12)
  bool isInventoryCategory;
  @HiveField(13)
  bool isUsingNote;
  @HiveField(14)
  bool isUsingPickUpDate;
  @HiveField(15)
  String unicode;
  @HiveField(16)
  bool isDeleted;
  @HiveField(17)
  int orderIndex;
  @HiveField(18)
  bool isForSelfOrder;
  @HiveField(19)
  bool isOnlineOrder;
  @HiveField(20)
  List<NameList> nameList;
  
  MenuCategory(
    this.id,
    this.parentId,
    this.isParent,
    this.companyID,
    this.branchID,
    this.salesCategoryID,
    this.icon,
    this.colorCode,
    this.active,
    this.isUsingSchedule,
    this.onlineVisible,
    this.localVisible,
    this.isInventoryCategory,
    this.isUsingNote,
    this.isUsingPickUpDate,
    this.unicode,
    this.isDeleted,
    this.orderIndex,
    this.isForSelfOrder,
    this.isOnlineOrder,
    this.nameList
  );

  factory MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}