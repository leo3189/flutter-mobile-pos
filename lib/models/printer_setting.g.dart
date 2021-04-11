// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrinterSettingAdapter extends TypeAdapter<PrinterSetting> {
  @override
  final int typeId = 54;

  @override
  PrinterSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrinterSetting(
      fields[0] as bool,
      fields[1] as bool,
      fields[2] as bool,
      fields[3] as bool,
      fields[4] as int,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrinterSetting obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.autoSalesReceipt)
      ..writeByte(1)
      ..write(obj.ccInSalesReceipt)
      ..writeByte(2)
      ..write(obj.printerNumSlip)
      ..writeByte(3)
      ..write(obj.reqGiftCardSignature)
      ..writeByte(4)
      ..write(obj.ccReceiptPrintAction)
      ..writeByte(5)
      ..write(obj.branchID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrinterSetting _$PrinterSettingFromJson(Map<String, dynamic> json) {
  return PrinterSetting(
    json['autoSalesReceipt'] as bool,
    json['ccInSalesReceipt'] as bool,
    json['printerNumSlip'] as bool,
    json['reqGiftCardSignature'] as bool,
    json['ccReceiptPrintAction'] as int,
    json['branchID'] as String,
  );
}

Map<String, dynamic> _$PrinterSettingToJson(PrinterSetting instance) =>
    <String, dynamic>{
      'autoSalesReceipt': instance.autoSalesReceipt,
      'ccInSalesReceipt': instance.ccInSalesReceipt,
      'printerNumSlip': instance.printerNumSlip,
      'reqGiftCardSignature': instance.reqGiftCardSignature,
      'ccReceiptPrintAction': instance.ccReceiptPrintAction,
      'branchID': instance.branchID,
    };
