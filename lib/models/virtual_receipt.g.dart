// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_receipt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VirtualReceiptAdapter extends TypeAdapter<VirtualReceipt> {
  @override
  final int typeId = 51;

  @override
  VirtualReceipt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VirtualReceipt(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as int,
      fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VirtualReceipt obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.salesReceiptID)
      ..writeByte(4)
      ..write(obj.kitchenReceiptID)
      ..writeByte(5)
      ..write(obj.closeOutReportID)
      ..writeByte(6)
      ..write(obj.labelFormatID)
      ..writeByte(7)
      ..write(obj.parkerReceiptID)
      ..writeByte(8)
      ..write(obj.receiptTypeID)
      ..writeByte(9)
      ..write(obj.orderIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VirtualReceiptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VirtualReceipt _$VirtualReceiptFromJson(Map<String, dynamic> json) {
  return VirtualReceipt(
    json['id'] as String,
    json['companyID'] as String,
    json['name'] as String,
    json['salesReceiptID'] as String,
    json['kitchenReceiptID'] as String,
    json['closeOutReportID'] as String,
    json['labelFormatID'] as String,
    json['parkerReceiptID'] as String,
    json['receiptTypeID'] as int,
    json['orderIndex'] as int,
  );
}

Map<String, dynamic> _$VirtualReceiptToJson(VirtualReceipt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'name': instance.name,
      'salesReceiptID': instance.salesReceiptID,
      'kitchenReceiptID': instance.kitchenReceiptID,
      'closeOutReportID': instance.closeOutReportID,
      'labelFormatID': instance.labelFormatID,
      'parkerReceiptID': instance.parkerReceiptID,
      'receiptTypeID': instance.receiptTypeID,
      'orderIndex': instance.orderIndex,
    };
