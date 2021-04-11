import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menuItem_printers.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class MenuItemPrinters {
  @HiveField(0)
  int menuItemID;
  @HiveField(1)
  String printerID;

  MenuItemPrinters(
    this.menuItemID,
    this.printerID
  );

  factory MenuItemPrinters.fromJson(Map<String, dynamic> json) => _$MenuItemPrintersFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemPrintersToJson(this);
}