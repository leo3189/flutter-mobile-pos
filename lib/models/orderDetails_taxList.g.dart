// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails_taxList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsTaxListAdapter extends TypeAdapter<OrderDetailsTaxList> {
  @override
  final int typeId = 17;

  @override
  OrderDetailsTaxList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsTaxList(
      orderDetailsID: fields[0] as String,
      taxRate: fields[3] as double,
      taxID: fields[1] as int,
      name: fields[2] as String,
      amt: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsTaxList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.orderDetailsID)
      ..writeByte(1)
      ..write(obj.taxID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.taxRate)
      ..writeByte(4)
      ..write(obj.amt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsTaxListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsTaxList _$OrderDetailsTaxListFromJson(Map<String, dynamic> json) {
  return OrderDetailsTaxList(
    orderDetailsID: json['orderDetailsID'] as String,
    taxRate: (json['taxRate'] as num)?.toDouble(),
    taxID: json['taxID'] as int,
    name: json['name'] as String,
    amt: (json['amt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderDetailsTaxListToJson(
        OrderDetailsTaxList instance) =>
    <String, dynamic>{
      'orderDetailsID': instance.orderDetailsID,
      'taxID': instance.taxID,
      'name': instance.name,
      'taxRate': instance.taxRate,
      'amt': instance.amt,
    };
