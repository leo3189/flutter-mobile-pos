// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_invoice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderInvoiceAdapter extends TypeAdapter<OrderInvoice> {
  @override
  final int typeId = 41;

  @override
  OrderInvoice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderInvoice(
      order: fields[0] as Order,
      invoices: (fields[1] as List)?.cast<Invoice>(),
      isNewOrder: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OrderInvoice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.order)
      ..writeByte(1)
      ..write(obj.invoices)
      ..writeByte(2)
      ..write(obj.isNewOrder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderInvoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInvoice _$OrderInvoiceFromJson(Map<String, dynamic> json) {
  return OrderInvoice(
    order: json['order'] == null
        ? null
        : Order.fromJson(json['order'] as Map<String, dynamic>),
    invoices: (json['invoices'] as List)
        ?.map((e) =>
            e == null ? null : Invoice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isNewOrder: json['isNewOrder'] as bool,
  );
}

Map<String, dynamic> _$OrderInvoiceToJson(OrderInvoice instance) =>
    <String, dynamic>{
      'order': instance.order?.toJson(),
      'invoices': instance.invoices?.map((e) => e?.toJson())?.toList(),
      'isNewOrder': instance.isNewOrder,
    };
