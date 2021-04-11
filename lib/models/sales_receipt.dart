import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales_receipt.g.dart';

@JsonSerializable()
@HiveType(typeId: 47)
class SalesReceipt {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  bool showHeader;
  @HiveField(3)
  int headerSpace;
  @HiveField(4)
  bool showLogo;
  @HiveField(5)
  bool showStoreInfo;
  @HiveField(6)
  int storeInfoSize;
  @HiveField(7)
  String headerText;
  @HiveField(8)
  bool showOrderNumber;
  @HiveField(9)
  int orderNumberSize;
  @HiveField(10)
  bool showTable;
  @HiveField(11)
  int tableSize;
  @HiveField(12)
  bool showNumberOfPpl;
  @HiveField(13)
  bool showOrderTime;
  @HiveField(14)
  int orderTimeSize;
  @HiveField(15)
  bool showCashierInfo;
  @HiveField(16)
  int cashierInfoSize;
  @HiveField(17)
  bool showCustomerInfo;
  @HiveField(18)
  int customerInfoSize;
  @HiveField(19)
  bool showOrder;
  @HiveField(20)
  bool orderRemark;
  @HiveField(21)
  int orderRemarkSize;
  @HiveField(22)
  bool showOneQty;
  @HiveField(23)
  int orderItemSize;
  @HiveField(24)
  bool showAbbreviate;
  @HiveField(25)
  bool showModGroupName;
  @HiveField(26)
  bool separateModification;
  @HiveField(27)
  int modificationSize;
  @HiveField(28)
  bool dividedLine;
  @HiveField(29)
  bool splitSameItems;
  @HiveField(30)
  bool showPaymentInfo;
  @HiveField(31)
  int subtotalSize;
  @HiveField(32)
  int totalAmtSize;
  @HiveField(33)
  bool showPaymentType;
  @HiveField(34)
  int paymentTypeSize;
  @HiveField(35)
  bool showPaymentStatus;
  @HiveField(36)
  int paymentStatusSize;
  @HiveField(37)
  bool showPONumber;
  @HiveField(38)
  bool showBarcode;
  @HiveField(39)
  bool showTips;
  @HiveField(40)
  int tipsSize;
  @HiveField(41)
  bool showOffers;
  @HiveField(42)
  bool taxExemptProof;
  @HiveField(43)
  bool showFooter;
  @HiveField(44)
  int footerTextSize;
  @HiveField(45)
  String footerText;
  @HiveField(46)
  int footerSpace;

  SalesReceipt(
    this.id,
    this.companyID,
    this.showHeader,
    this.headerSpace,
    this.showLogo,
    this.showStoreInfo,
    this.storeInfoSize,
    this.headerText,
    this.showOrderNumber,
    this.orderNumberSize,
    this.showTable,
    this.tableSize,
    this.showNumberOfPpl,
    this.showOrderTime,
    this.orderItemSize,
    this.showCashierInfo,
    this.cashierInfoSize,
    this.showCustomerInfo,
    this.customerInfoSize,
    this.showOrder,
    this.orderRemark,
    this.orderRemarkSize,
    this.showOneQty,
    this.orderTimeSize,
    this.showAbbreviate,
    this.showModGroupName,
    this.separateModification,
    this.modificationSize,
    this.dividedLine,
    this.splitSameItems,
    this.showPaymentInfo,
    this.subtotalSize,
    this.totalAmtSize,
    this.showPaymentType,
    this.paymentTypeSize,
    this.showPaymentStatus,
    this.paymentStatusSize,
    this.showPONumber,
    this.showBarcode,
    this.showTips,
    this.tipsSize,
    this.showOffers,
    this.taxExemptProof,
    this.showFooter,
    this.footerTextSize,
    this.footerText,
    this.footerSpace
  );

  factory SalesReceipt.fromJson(Map<String, dynamic> json) => _$SalesReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$SalesReceiptToJson(this);
}