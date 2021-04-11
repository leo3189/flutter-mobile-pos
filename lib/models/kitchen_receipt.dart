import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kitchen_receipt.g.dart';

@JsonSerializable()
@HiveType(typeId: 48)
class KitchenReceipt {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyId;
  @HiveField(2)
  bool showHeader;
  @HiveField(3)
  int headerSpace;
  @HiveField(4)
  bool showOrderNumber;
  @HiveField(5)
  int orderNumberSize;
  @HiveField(6)
  bool showOrderType;
  @HiveField(7)
  int orderTypeSize;
  @HiveField(8)
  bool showNumberOfPpl;
  @HiveField(9)
  bool showTable;
  @HiveField(10)
  bool showOrderTime;
  @HiveField(11)
  int orderTimeSize;
  @HiveField(12)
  bool showCashierInfo;
  @HiveField(13)
  int cashierInfoSize;
  @HiveField(14)
  bool showOneQty;
  @HiveField(15)
  bool showAbbreviate;
  @HiveField(16)
  int orderItemSize;
  @HiveField(17)
  bool dividedLine;
  @HiveField(18)
  int footerSpace;
  @HiveField(19)
  bool cutOneByOne;
  @HiveField(20)
  bool separatedModification;
  @HiveField(21)
  int modificationSize;
  @HiveField(22)
  bool splitSameItems;
  @HiveField(23)
  bool showPrice;
  @HiveField(24)
  bool orderRemark;
  @HiveField(25)
  int orderRemarkSize;

  KitchenReceipt(
    this.id,
    this.companyId,
    this.showHeader,
    this.headerSpace,
    this.showOrderNumber,
    this.orderNumberSize,
    this.showOrderType,
    this.orderTypeSize,
    this.showNumberOfPpl,
    this.showTable,
    this.showOrderTime,
    this.orderTimeSize,
    this.showCashierInfo,
    this.cashierInfoSize,
    this.showOneQty,
    this.showAbbreviate,
    this.orderItemSize,
    this.dividedLine,
    this.footerSpace,
    this.cutOneByOne,
    this.separatedModification,
    this.modificationSize,
    this.splitSameItems,
    this.showPrice,
    this.orderRemark,
    this.orderRemarkSize,
  );

  factory KitchenReceipt.fromJson(Map<String, dynamic> json) => _$KitchenReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$KitchenReceiptToJson(this);
}