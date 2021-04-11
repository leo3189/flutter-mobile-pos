import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_menuCategory.g.dart';

@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'MenuMenuCategoryAdapter')
class MenuMenuCategory {
  @HiveField(0)
  int menuID;
  @HiveField(1)
  int menuCategoryID;
  @HiveField(2)
  int orderIndex;
  @HiveField(3)
  dynamic parentMenuId;
  @HiveField(4)
  dynamic parentMenuCategoryId;
  @HiveField(5)
  dynamic menuCategory;

  MenuMenuCategory(
    this.menuID,
    this.menuCategory,
    this.menuCategoryID,
    this.orderIndex,
    this.parentMenuCategoryId,
    this.parentMenuId
  );

  factory MenuMenuCategory.fromJson(Map<String, dynamic> json) => _$MenuMenuCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$MenuMenuCategoryToJson(this);
}