import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'printer_setting.g.dart';

@JsonSerializable()
@HiveType(typeId: 54)
class PrinterSetting {
  @HiveField(0)
  bool autoSalesReceipt;
  @HiveField(1)
  bool ccInSalesReceipt;
  @HiveField(2)
  bool printerNumSlip;
  @HiveField(3)
  bool reqGiftCardSignature;
  @HiveField(4)
  int ccReceiptPrintAction;
  @HiveField(5)
  String branchID;

  PrinterSetting(
    this.autoSalesReceipt,
    this.ccInSalesReceipt,
    this.printerNumSlip,
    this.reqGiftCardSignature,
    this.ccReceiptPrintAction,
    this.branchID
  );
  
  factory PrinterSetting.fromJson(Map<String, dynamic> json) => _$PrinterSettingFromJson(json);
  Map<String, dynamic> toJson() => _$PrinterSettingToJson(this);
}