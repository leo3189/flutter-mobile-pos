// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails_discountList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsDiscountListAdapter
    extends TypeAdapter<OrderDetailsDiscountList> {
  @override
  final int typeId = 23;

  @override
  OrderDetailsDiscountList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsDiscountList(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as String,
      fields[5] as double,
      fields[6] as double,
      fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsDiscountList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDetailsID)
      ..writeByte(2)
      ..write(obj.discountID)
      ..writeByte(3)
      ..write(obj.discountBy)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.amt)
      ..writeByte(7)
      ..write(obj.isAmtDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsDiscountListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsDiscountList _$OrderDetailsDiscountListFromJson(
    Map<String, dynamic> json) {
  return OrderDetailsDiscountList(
    json['id'] as String,
    json['orderDetailsID'] as String,
    json['discountID'] as int,
    json['discountBy'] as int,
    json['name'] as String,
    (json['rate'] as num)?.toDouble(),
    (json['amt'] as num)?.toDouble(),
    json['isAmtDiscount'] as bool,
  );
}

Map<String, dynamic> _$OrderDetailsDiscountListToJson(
        OrderDetailsDiscountList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDetailsID': instance.orderDetailsID,
      'discountID': instance.discountID,
      'discountBy': instance.discountBy,
      'name': instance.name,
      'rate': instance.rate,
      'amt': instance.amt,
      'isAmtDiscount': instance.isAmtDiscount,
    };
