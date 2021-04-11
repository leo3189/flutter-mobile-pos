// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaxesAdapter extends TypeAdapter<Taxes> {
  @override
  final int typeId = 21;

  @override
  Taxes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taxes(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as dynamic,
      fields[5] as String,
      fields[6] as String,
      fields[7] as double,
      fields[8] as bool,
      fields[9] as dynamic,
      fields[10] as bool,
      fields[11] as int,
      fields[12] as bool,
      (fields[13] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Taxes obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taxSectionId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.taxNumber)
      ..writeByte(5)
      ..write(obj.branchId)
      ..writeByte(6)
      ..write(obj.companyId)
      ..writeByte(7)
      ..write(obj.rate)
      ..writeByte(8)
      ..write(obj.isParent)
      ..writeByte(9)
      ..write(obj.parentId)
      ..writeByte(10)
      ..write(obj.isEnabled)
      ..writeByte(11)
      ..write(obj.orderIndex)
      ..writeByte(12)
      ..write(obj.inclusiveTax)
      ..writeByte(13)
      ..write(obj.excludedOrderTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Taxes _$TaxesFromJson(Map<String, dynamic> json) {
  return Taxes(
    json['id'] as int,
    json['taxSectionId'] as int,
    json['name'] as String,
    json['description'] as String,
    json['taxNumber'],
    json['branchId'] as String,
    json['companyId'] as String,
    (json['rate'] as num)?.toDouble(),
    json['isParent'] as bool,
    json['parentId'],
    json['isEnabled'] as bool,
    json['orderIndex'] as int,
    json['inclusiveTax'] as bool,
    json['excludedOrderTypes'] as List,
  );
}

Map<String, dynamic> _$TaxesToJson(Taxes instance) => <String, dynamic>{
      'id': instance.id,
      'taxSectionId': instance.taxSectionId,
      'name': instance.name,
      'description': instance.description,
      'taxNumber': instance.taxNumber,
      'branchId': instance.branchId,
      'companyId': instance.companyId,
      'rate': instance.rate,
      'isParent': instance.isParent,
      'parentId': instance.parentId,
      'isEnabled': instance.isEnabled,
      'orderIndex': instance.orderIndex,
      'inclusiveTax': instance.inclusiveTax,
      'excludedOrderTypes': instance.excludedOrderTypes,
    };
