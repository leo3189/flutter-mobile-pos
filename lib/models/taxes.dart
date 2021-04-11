import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'taxes.g.dart';

@JsonSerializable()
@HiveType(typeId: 21)
class Taxes {
  @HiveField(0)
  int id;
  @HiveField(1)
  int taxSectionId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String description;
  @HiveField(4)
  dynamic taxNumber;
  @HiveField(5)
  String branchId;
  @HiveField(6)
  String companyId;
  @HiveField(7)
  double rate;
  @HiveField(8)
  bool isParent;
  @HiveField(9)
  dynamic parentId;
  @HiveField(10)
  bool isEnabled;
  @HiveField(11)
  int orderIndex;
  @HiveField(12)
  bool inclusiveTax;
  @HiveField(13)
  List<dynamic> excludedOrderTypes;

  Taxes(
    this.id,
    this.taxSectionId,
    this.name,
    this.description,
    this.taxNumber,
    this.branchId,
    this.companyId,
    this.rate,
    this.isParent,
    this.parentId,
    this.isEnabled,
    this.orderIndex,
    this.inclusiveTax,
    this.excludedOrderTypes
  );

  factory Taxes.fromJson(Map<String, dynamic> json) => _$TaxesFromJson(json);
  Map<String, dynamic> toJson() => _$TaxesToJson(this);
}