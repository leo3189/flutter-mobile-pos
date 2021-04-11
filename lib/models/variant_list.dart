import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'variant_list.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 38)
class VariantList {
  @HiveField(0)
  int id;
  @HiveField(1)
  bool isParent;
  @HiveField(2)
  dynamic parentId;
  @HiveField(3)
  String branchId;
  @HiveField(4)
  int variantGroupID;
  @HiveField(5)
  bool isEnabled;
  @HiveField(6)
  String companyID;
  @HiveField(7)
  bool isDeleted;
  @HiveField(8)
  int orderIndex;
  @HiveField(9)
  List<VariantListNameList> nameList;

  VariantList(
    this.id,
    this.isParent,
    this.parentId,
    this.branchId,
    this.variantGroupID,
    this.isEnabled,
    this.companyID,
    this.isDeleted,
    this.orderIndex,
    this.nameList
  );

  factory VariantList.fromJson(Map<String, dynamic> json) => _$VariantListFromJson(json);
  Map<String, dynamic> toJson() => _$VariantListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 37)
class VariantListNameList {
  @HiveField(0)
  int id;
  @HiveField(1)
  int variantID;
  @HiveField(2)
  int languageID;
  @HiveField(3)
  String fullName;
  @HiveField(4)
  dynamic shortName;
  @HiveField(5)
  int orderIndex;

  VariantListNameList(
    this.id,
    this.variantID,
    this.languageID,
    this.fullName,
    this.shortName,
    this.orderIndex
  );

  factory VariantListNameList.fromJson(Map<String, dynamic> json) => _$VariantListNameListFromJson(json);
  Map<String, dynamic> toJson() => _$VariantListNameListToJson(this);
}