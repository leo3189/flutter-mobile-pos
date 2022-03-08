import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/variant_list.dart';

part 'variant_group.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 36)
class VariantGroup {
  @HiveField(0)
  int id;
  @HiveField(1)
  dynamic parentId;
  @HiveField(2)
  String branchId;
  @HiveField(3)
  String companyID;
  @HiveField(4)
  bool isDeleted;
  @HiveField(5)
  String icon;
  @HiveField(6)
  String unicode;
  @HiveField(7)
  bool isParent;
  @HiveField(8)
  bool isActive;
  @HiveField(9)
  int orderIndex;
  @HiveField(10)
  List<VariantList> variantList;
  @HiveField(11)
  List<VariantGroupsNameList> nameList;

  VariantGroup(
    this.id,
    this.parentId,
    this.branchId,
    this.companyID,
    this.isDeleted,
    this.icon,
    this.unicode,
    this.isParent,
    this.isActive,
    this.orderIndex,
    this.variantList,
    this.nameList
  );

  factory VariantGroup.fromJson(Map<String, dynamic> json) => _$VariantGroupFromJson(json);
  Map<String, dynamic> toJson() => _$VariantGroupToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 35)
class VariantGroupsNameList {
  @HiveField(0)
  int id;
  @HiveField(1)
  int variantGroupID;
  @HiveField(2)
  int languageID;
  @HiveField(3)
  String fullName;
  @HiveField(4)
  dynamic shortName;
  @HiveField(5)
  int orderIndex;

  VariantGroupsNameList(
    this.id,
    this.variantGroupID,
    this.languageID,
    this.fullName,
    this.shortName,
    this.orderIndex
  );

  factory VariantGroupsNameList.fromJson(Map<String, dynamic> json) => _$VariantGroupsNameListFromJson(json);
  Map<String, dynamic> toJson() => _$VariantGroupsNameListToJson(this);
}