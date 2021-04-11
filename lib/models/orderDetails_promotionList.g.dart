// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails_promotionList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsPromotionListAdapter
    extends TypeAdapter<OrderDetailsPromotionList> {
  @override
  final int typeId = 20;

  @override
  OrderDetailsPromotionList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsPromotionList(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsPromotionList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDetailsID)
      ..writeByte(2)
      ..write(obj.promotionID)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.amt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsPromotionListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsPromotionList _$OrderDetailsPromotionListFromJson(
    Map<String, dynamic> json) {
  return OrderDetailsPromotionList(
    json['id'] as String,
    json['orderDetailsID'] as String,
    json['promotionID'] as int,
    json['description'] as String,
    (json['amt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderDetailsPromotionListToJson(
        OrderDetailsPromotionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDetailsID': instance.orderDetailsID,
      'promotionID': instance.promotionID,
      'description': instance.description,
      'amt': instance.amt,
    };
