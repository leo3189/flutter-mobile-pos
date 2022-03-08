import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_mobile_pos/models/kitchen_receipt.dart';
import 'package:flutter_mobile_pos/models/label_format.dart';
import 'package:flutter_mobile_pos/models/sales_receipt.dart';

part 'virtual_receipt.g.dart';

@JsonSerializable()
@HiveType(typeId: 51)
class VirtualReceipt {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String name;
  @HiveField(3)
  String salesReceiptID;
  @HiveField(4)
  String kitchenReceiptID;
  @HiveField(5)
  String closeOutReportID;
  @HiveField(6)
  String labelFormatID;
  @HiveField(7)
  String parkerReceiptID;
  @HiveField(8)
  int receiptTypeID;
  @HiveField(9)
  int orderIndex;

  @JsonKey(ignore: true)
  SalesReceipt salesReceipt;
  @JsonKey(ignore: true)
  KitchenReceipt kitchenReceipt;
  @JsonKey(ignore: true)
  LabelFormat labelFormat;
  @JsonKey(ignore: true)
  SalesReceipt packerReceipt;

  VirtualReceipt(
    this.id,
    this.companyID,
    this.name,
    this.salesReceiptID,
    this.kitchenReceiptID,
    this.closeOutReportID,
    this.labelFormatID,
    this.parkerReceiptID,
    this.receiptTypeID,
    this.orderIndex
  );

  factory VirtualReceipt.fromJson(Map<String, dynamic> json) => _$VirtualReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$VirtualReceiptToJson(this);
}

class ReceiptType {
  static const SALE = 1;
  static const KITCHEN = 2;
  static const CLOSE_OUT = 3;
  static const LABEL = 4;
  static const PACKER = 5;
}