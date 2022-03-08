import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/menu_menuCategory.dart';
import 'package:flutter_mobile_pos/models/name_list.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class Menu {
  @HiveField(0)
  dynamic parentId;
  @HiveField(1)
  bool isParent;
  @HiveField(2)
  bool onlineVisible;
  @HiveField(3)
  bool localVisible;
  @HiveField(4)
  bool active;
  @HiveField(5)
  bool isDeleted;
  @HiveField(6)
  bool isForSelfOrder;
  @HiveField(7)
  int id;
  @HiveField(8)
  String branchID;
  @HiveField(9)
  String companyID;
  @HiveField(10)
  int orderIndex;
  @HiveField(11)
  dynamic colorCode;
  @HiveField(12)
  String icon;
  @HiveField(13)
  bool isUsingSchedule;
  @HiveField(14)
  bool is3LevelMenu;
  @HiveField(15)
  String unicode;
  @HiveField(16)
  List<NameList> nameList;
  @HiveField(17)
  List<MenuMenuCategory> menuCategories;
  @HiveField(18)
  List<dynamic> menuItems;

  Menu(
    this.parentId,
    this.isParent,
    this.onlineVisible,
    this.localVisible,
    this.active,
    this.isDeleted,
    this.isForSelfOrder,
    this.id,
    this.branchID,
    this.companyID,
    this.orderIndex,
    this.colorCode,
    this.icon,
    this.isUsingSchedule,
    this.is3LevelMenu,
    this.unicode,
    this.nameList,
    this.menuCategories,
    this.menuItems
  );

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

