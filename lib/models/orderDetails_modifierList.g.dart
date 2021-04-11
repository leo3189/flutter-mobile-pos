// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetails_modifierList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsModifierListAdapter
    extends TypeAdapter<OrderDetailsModifierList> {
  @override
  final int typeId = 18;

  @override
  OrderDetailsModifierList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsModifierList(
      id: fields[0] as String,
      orderDetailsID: fields[1] as String,
      modifierItemID: fields[2] as int,
      menuItemQty: fields[3] as int,
      qty: fields[4] as int,
      totalAmt: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsModifierList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDetailsID)
      ..writeByte(2)
      ..write(obj.modifierItemID)
      ..writeByte(3)
      ..write(obj.menuItemQty)
      ..writeByte(4)
      ..write(obj.qty)
      ..writeByte(5)
      ..write(obj.totalAmt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsModifierListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModifierList _$OrderDetailsModifierListFromJson(
    Map<String, dynamic> json) {
  return OrderDetailsModifierList(
    id: json['id'] as String,
    orderDetailsID: json['orderDetailsID'] as String,
    modifierItemID: json['modifierItemID'] as int,
    menuItemQty: json['menuItemQty'] as int,
    qty: json['qty'] as int,
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderDetailsModifierListToJson(
        OrderDetailsModifierList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDetailsID': instance.orderDetailsID,
      'modifierItemID': instance.modifierItemID,
      'menuItemQty': instance.menuItemQty,
      'qty': instance.qty,
      'totalAmt': instance.totalAmt,
    };
