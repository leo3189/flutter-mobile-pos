import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'name_list.g.dart';

@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'NameListAdapter')
class NameList {
  @HiveField(0)
  int id;
  @HiveField(1)
  int menuID;
  @HiveField(2)
  int languageID;
  @HiveField(3)
  String localName;
  @HiveField(4)
  dynamic onlineName;
  @HiveField(5)
  dynamic shortName;
  @HiveField(6)
  int orderIndex;

  NameList(
    this.id,
    this.menuID,
    this.languageID,
    this.localName,
    this.onlineName,
    this.orderIndex,
    this.shortName
  );

  factory NameList.fromJson(Map<String, dynamic> json) => _$NameListFromJson(json);
  Map<String, dynamic> toJson() => _$NameListToJson(this);
}