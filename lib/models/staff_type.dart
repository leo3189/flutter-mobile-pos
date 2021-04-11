import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_type.g.dart';

@JsonSerializable()
@HiveType(typeId: 46)
class StaffType {
  @HiveField(0)
  int id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String name;
  @HiveField(3)
  double employeeDiscount;
  @HiveField(4)
  String colorCode;
  @HiveField(5)
  String description;
  @HiveField(6)
  bool isDeleted;
  @HiveField(7)
  int timeInterval;
  @HiveField(8)
  bool takeOrder;
  @HiveField(9)
  bool openDrawer;
  @HiveField(10)
  bool giftCardSell;
  @HiveField(11)
  bool certificateSell;
  @HiveField(12)
  bool payout;
  @HiveField(13)
  bool voidOrders;
  @HiveField(14)
  bool tipAdjust;
  @HiveField(15)
  bool tipAdjustBatchClose;
  @HiveField(16)
  bool customerInfo;
  @HiveField(17)
  bool accessSummary;
  @HiveField(18)
  bool discountEmployee;
  @HiveField(19)
  bool creditCardOnly;
  @HiveField(20)
  bool surcharge;
  @HiveField(21)
  bool rewardReload;
  @HiveField(22)
  bool rewardRedeem;
  @HiveField(23)
  bool acceptCash;
  @HiveField(24)
  bool priceOverride;
  @HiveField(25)
  bool reopenOrders;
  @HiveField(26)
  bool closeOut;
  @HiveField(27)
  bool closeOutHistory;
  @HiveField(28)
  bool discountAll;
  @HiveField(29)
  bool tipAdjustRefund;
  @HiveField(30)
  bool terminalSetting;
  @HiveField(31)
  bool viewTransacions;
  @HiveField(32)
  bool viewAllTransactions;
  @HiveField(33)
  bool voidTransactions;
  @HiveField(34)
  bool floorPlanEdit;
  @HiveField(35)
  bool changeServer;
  @HiveField(36)
  bool taxExempt;
  @HiveField(37)
  bool houseComp;
  @HiveField(38)
  bool approveOT;
  @HiveField(39)
  bool removeLocks;
  @HiveField(40)
  bool isForSelfOrderUser;

  StaffType({
    this.id,
    this.companyID,
    this.name,
    this.employeeDiscount,
    this.colorCode,
    this.description,
    this.isDeleted,
    this.timeInterval,
    this.takeOrder,
    this.openDrawer,
    this.giftCardSell,
    this.certificateSell,
    this.payout,
    this.voidOrders,
    this.tipAdjust,
    this.tipAdjustBatchClose,
    this.customerInfo,
    this.accessSummary,
    this.discountEmployee,
    this.creditCardOnly,
    this.surcharge,
    this.rewardReload,
    this.rewardRedeem,
    this.acceptCash,
    this.priceOverride,
    this.reopenOrders,
    this.closeOut,
    this.closeOutHistory,
    this.discountAll,
    this.tipAdjustRefund,
    this.terminalSetting,
    this.viewAllTransactions,
    this.viewTransacions,
    this.voidTransactions,
    this.floorPlanEdit,
    this.changeServer,
    this.taxExempt,
    this.houseComp,
    this.approveOT,
    this.removeLocks,
    this.isForSelfOrderUser
  });

  factory StaffType.fromJson(Map<String, dynamic> json) => _$StaffTypeFromJson(json);
  Map<String, dynamic> toJson() => _$StaffTypeToJson(this);
}