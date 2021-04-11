import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xpress_mobile_pos/models/virtual_receipt.dart';

part 'printer.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 50)
class Printer {
  @HiveField(0)
  String id;
  @HiveField(1)
  String branchID;
  @HiveField(2)
  String name;
  @HiveField(3)
  String virtualReceiptID;
  @HiveField(4)
  int copies;
  @HiveField(5)
  bool selfOrderPrinter;
  @HiveField(6)
  List<PrinterLanguage> languages;
  @HiveField(7)
  List<PrinterOrderType> orderTypes;

  @JsonKey(ignore: true)
  VirtualReceipt virtualReceipt;

  Printer(
    this.id,
    this.branchID,
    this.name,
    this.virtualReceiptID,
    this.copies,
    this.selfOrderPrinter,
    this.languages,
    this.orderTypes
  );

  factory Printer.fromJson(Map<String, dynamic> json) => _$PrinterFromJson(json);
  Map<String, dynamic> toJson() => _$PrinterToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 52)
class PrinterLanguage {
  @HiveField(0)
  String printerID;
  @HiveField(1)
  int languageID;
  @HiveField(2)
  int orderIndex;

  PrinterLanguage(
    this.printerID,
    this.languageID,
    this.orderIndex
  );

  factory PrinterLanguage.fromJson(Map<String, dynamic> json) => _$PrinterLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$PrinterLanguageToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 53)
class PrinterOrderType {
  @HiveField(0)
  String printerID;
  @HiveField(1)
  int orderTypeID;

  PrinterOrderType(
    this.printerID,
    this.orderTypeID
  );

  factory PrinterOrderType.fromJson(Map<String, dynamic> json) => _$PrinterOrderTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PrinterOrderTypeToJson(this);
}