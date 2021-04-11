// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_taxList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderTaxListAdapter extends TypeAdapter<OrderTaxList> {
  @override
  final int typeId = 22;

  @override
  OrderTaxList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderTaxList(
      orderID: fields[0] as String,
      taxID: fields[1] as int,
      name: fields[2] as String,
      taxRate: fields[3] as double,
      amt: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderTaxList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.orderID)
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
      other is OrderTaxListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTaxList _$OrderTaxListFromJson(Map<String, dynamic> json) {
  return OrderTaxList(
    orderID: json['orderID'] as String,
    taxID: json['taxID'] as int,
    name: json['name'] as String,
    taxRate: (json['taxRate'] as num)?.toDouble(),
    amt: (json['amt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderTaxListToJson(OrderTaxList instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'taxID': instance.taxID,
      'name': instance.name,
      'taxRate': instance.taxRate,
      'amt': instance.amt,
    };
