// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffTypeAdapter extends TypeAdapter<StaffType> {
  @override
  final int typeId = 46;

  @override
  StaffType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffType(
      id: fields[0] as int,
      companyID: fields[1] as String,
      name: fields[2] as String,
      employeeDiscount: fields[3] as double,
      colorCode: fields[4] as String,
      description: fields[5] as String,
      isDeleted: fields[6] as bool,
      timeInterval: fields[7] as int,
      takeOrder: fields[8] as bool,
      openDrawer: fields[9] as bool,
      giftCardSell: fields[10] as bool,
      certificateSell: fields[11] as bool,
      payout: fields[12] as bool,
      voidOrders: fields[13] as bool,
      tipAdjust: fields[14] as bool,
      tipAdjustBatchClose: fields[15] as bool,
      customerInfo: fields[16] as bool,
      accessSummary: fields[17] as bool,
      discountEmployee: fields[18] as bool,
      creditCardOnly: fields[19] as bool,
      surcharge: fields[20] as bool,
      rewardReload: fields[21] as bool,
      rewardRedeem: fields[22] as bool,
      acceptCash: fields[23] as bool,
      priceOverride: fields[24] as bool,
      reopenOrders: fields[25] as bool,
      closeOut: fields[26] as bool,
      closeOutHistory: fields[27] as bool,
      discountAll: fields[28] as bool,
      tipAdjustRefund: fields[29] as bool,
      terminalSetting: fields[30] as bool,
      viewAllTransactions: fields[32] as bool,
      viewTransacions: fields[31] as bool,
      voidTransactions: fields[33] as bool,
      floorPlanEdit: fields[34] as bool,
      changeServer: fields[35] as bool,
      taxExempt: fields[36] as bool,
      houseComp: fields[37] as bool,
      approveOT: fields[38] as bool,
      removeLocks: fields[39] as bool,
      isForSelfOrderUser: fields[40] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StaffType obj) {
    writer
      ..writeByte(41)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.employeeDiscount)
      ..writeByte(4)
      ..write(obj.colorCode)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isDeleted)
      ..writeByte(7)
      ..write(obj.timeInterval)
      ..writeByte(8)
      ..write(obj.takeOrder)
      ..writeByte(9)
      ..write(obj.openDrawer)
      ..writeByte(10)
      ..write(obj.giftCardSell)
      ..writeByte(11)
      ..write(obj.certificateSell)
      ..writeByte(12)
      ..write(obj.payout)
      ..writeByte(13)
      ..write(obj.voidOrders)
      ..writeByte(14)
      ..write(obj.tipAdjust)
      ..writeByte(15)
      ..write(obj.tipAdjustBatchClose)
      ..writeByte(16)
      ..write(obj.customerInfo)
      ..writeByte(17)
      ..write(obj.accessSummary)
      ..writeByte(18)
      ..write(obj.discountEmployee)
      ..writeByte(19)
      ..write(obj.creditCardOnly)
      ..writeByte(20)
      ..write(obj.surcharge)
      ..writeByte(21)
      ..write(obj.rewardReload)
      ..writeByte(22)
      ..write(obj.rewardRedeem)
      ..writeByte(23)
      ..write(obj.acceptCash)
      ..writeByte(24)
      ..write(obj.priceOverride)
      ..writeByte(25)
      ..write(obj.reopenOrders)
      ..writeByte(26)
      ..write(obj.closeOut)
      ..writeByte(27)
      ..write(obj.closeOutHistory)
      ..writeByte(28)
      ..write(obj.discountAll)
      ..writeByte(29)
      ..write(obj.tipAdjustRefund)
      ..writeByte(30)
      ..write(obj.terminalSetting)
      ..writeByte(31)
      ..write(obj.viewTransacions)
      ..writeByte(32)
      ..write(obj.viewAllTransactions)
      ..writeByte(33)
      ..write(obj.voidTransactions)
      ..writeByte(34)
      ..write(obj.floorPlanEdit)
      ..writeByte(35)
      ..write(obj.changeServer)
      ..writeByte(36)
      ..write(obj.taxExempt)
      ..writeByte(37)
      ..write(obj.houseComp)
      ..writeByte(38)
      ..write(obj.approveOT)
      ..writeByte(39)
      ..write(obj.removeLocks)
      ..writeByte(40)
      ..write(obj.isForSelfOrderUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffType _$StaffTypeFromJson(Map<String, dynamic> json) {
  return StaffType(
    id: json['id'] as int,
    companyID: json['companyID'] as String,
    name: json['name'] as String,
    employeeDiscount: (json['employeeDiscount'] as num)?.toDouble(),
    colorCode: json['colorCode'] as String,
    description: json['description'] as String,
    isDeleted: json['isDeleted'] as bool,
    timeInterval: json['timeInterval'] as int,
    takeOrder: json['takeOrder'] as bool,
    openDrawer: json['openDrawer'] as bool,
    giftCardSell: json['giftCardSell'] as bool,
    certificateSell: json['certificateSell'] as bool,
    payout: json['payout'] as bool,
    voidOrders: json['voidOrders'] as bool,
    tipAdjust: json['tipAdjust'] as bool,
    tipAdjustBatchClose: json['tipAdjustBatchClose'] as bool,
    customerInfo: json['customerInfo'] as bool,
    accessSummary: json['accessSummary'] as bool,
    discountEmployee: json['discountEmployee'] as bool,
    creditCardOnly: json['creditCardOnly'] as bool,
    surcharge: json['surcharge'] as bool,
    rewardReload: json['rewardReload'] as bool,
    rewardRedeem: json['rewardRedeem'] as bool,
    acceptCash: json['acceptCash'] as bool,
    priceOverride: json['priceOverride'] as bool,
    reopenOrders: json['reopenOrders'] as bool,
    closeOut: json['closeOut'] as bool,
    closeOutHistory: json['closeOutHistory'] as bool,
    discountAll: json['discountAll'] as bool,
    tipAdjustRefund: json['tipAdjustRefund'] as bool,
    terminalSetting: json['terminalSetting'] as bool,
    viewAllTransactions: json['viewAllTransactions'] as bool,
    viewTransacions: json['viewTransacions'] as bool,
    voidTransactions: json['voidTransactions'] as bool,
    floorPlanEdit: json['floorPlanEdit'] as bool,
    changeServer: json['changeServer'] as bool,
    taxExempt: json['taxExempt'] as bool,
    houseComp: json['houseComp'] as bool,
    approveOT: json['approveOT'] as bool,
    removeLocks: json['removeLocks'] as bool,
    isForSelfOrderUser: json['isForSelfOrderUser'] as bool,
  );
}

Map<String, dynamic> _$StaffTypeToJson(StaffType instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'name': instance.name,
      'employeeDiscount': instance.employeeDiscount,
      'colorCode': instance.colorCode,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'timeInterval': instance.timeInterval,
      'takeOrder': instance.takeOrder,
      'openDrawer': instance.openDrawer,
      'giftCardSell': instance.giftCardSell,
      'certificateSell': instance.certificateSell,
      'payout': instance.payout,
      'voidOrders': instance.voidOrders,
      'tipAdjust': instance.tipAdjust,
      'tipAdjustBatchClose': instance.tipAdjustBatchClose,
      'customerInfo': instance.customerInfo,
      'accessSummary': instance.accessSummary,
      'discountEmployee': instance.discountEmployee,
      'creditCardOnly': instance.creditCardOnly,
      'surcharge': instance.surcharge,
      'rewardReload': instance.rewardReload,
      'rewardRedeem': instance.rewardRedeem,
      'acceptCash': instance.acceptCash,
      'priceOverride': instance.priceOverride,
      'reopenOrders': instance.reopenOrders,
      'closeOut': instance.closeOut,
      'closeOutHistory': instance.closeOutHistory,
      'discountAll': instance.discountAll,
      'tipAdjustRefund': instance.tipAdjustRefund,
      'terminalSetting': instance.terminalSetting,
      'viewTransacions': instance.viewTransacions,
      'viewAllTransactions': instance.viewAllTransactions,
      'voidTransactions': instance.voidTransactions,
      'floorPlanEdit': instance.floorPlanEdit,
      'changeServer': instance.changeServer,
      'taxExempt': instance.taxExempt,
      'houseComp': instance.houseComp,
      'approveOT': instance.approveOT,
      'removeLocks': instance.removeLocks,
      'isForSelfOrderUser': instance.isForSelfOrderUser,
    };
