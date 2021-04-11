// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_format.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabelFormatAdapter extends TypeAdapter<LabelFormat> {
  @override
  final int typeId = 49;

  @override
  LabelFormat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LabelFormat(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as int,
      fields[4] as bool,
      fields[5] as bool,
      fields[6] as int,
      fields[7] as bool,
      fields[8] as bool,
      fields[9] as bool,
      fields[10] as bool,
      fields[11] as bool,
      fields[12] as bool,
      fields[13] as bool,
      fields[14] as bool,
      fields[15] as bool,
      fields[16] as bool,
      fields[17] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LabelFormat obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyId)
      ..writeByte(2)
      ..write(obj.showHeader)
      ..writeByte(3)
      ..write(obj.orderNumberSize)
      ..writeByte(4)
      ..write(obj.showLogo)
      ..writeByte(5)
      ..write(obj.showOrderTime)
      ..writeByte(6)
      ..write(obj.orderTimeSize)
      ..writeByte(7)
      ..write(obj.dividedLine)
      ..writeByte(8)
      ..write(obj.showOrderType)
      ..writeByte(9)
      ..write(obj.cutomerInfo)
      ..writeByte(10)
      ..write(obj.showBody)
      ..writeByte(11)
      ..write(obj.itemAbbreviate)
      ..writeByte(12)
      ..write(obj.modifierAbbreviate)
      ..writeByte(13)
      ..write(obj.showPrice)
      ..writeByte(14)
      ..write(obj.showNumberOfOrder)
      ..writeByte(15)
      ..write(obj.showItemNotes)
      ..writeByte(16)
      ..write(obj.languageLayout)
      ..writeByte(17)
      ..write(obj.separateModifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabelFormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelFormat _$LabelFormatFromJson(Map<String, dynamic> json) {
  return LabelFormat(
    json['id'] as String,
    json['companyId'] as String,
    json['showHeader'] as bool,
    json['orderNumberSize'] as int,
    json['showLogo'] as bool,
    json['showOrderTime'] as bool,
    json['orderTimeSize'] as int,
    json['dividedLine'] as bool,
    json['showOrderType'] as bool,
    json['cutomerInfo'] as bool,
    json['showBody'] as bool,
    json['itemAbbreviate'] as bool,
    json['modifierAbbreviate'] as bool,
    json['showPrice'] as bool,
    json['showNumberOfOrder'] as bool,
    json['showItemNotes'] as bool,
    json['languageLayout'] as bool,
    json['separateModifier'] as bool,
  );
}

Map<String, dynamic> _$LabelFormatToJson(LabelFormat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'showHeader': instance.showHeader,
      'orderNumberSize': instance.orderNumberSize,
      'showLogo': instance.showLogo,
      'showOrderTime': instance.showOrderTime,
      'orderTimeSize': instance.orderTimeSize,
      'dividedLine': instance.dividedLine,
      'showOrderType': instance.showOrderType,
      'cutomerInfo': instance.cutomerInfo,
      'showBody': instance.showBody,
      'itemAbbreviate': instance.itemAbbreviate,
      'modifierAbbreviate': instance.modifierAbbreviate,
      'showPrice': instance.showPrice,
      'showNumberOfOrder': instance.showNumberOfOrder,
      'showItemNotes': instance.showItemNotes,
      'languageLayout': instance.languageLayout,
      'separateModifier': instance.separateModifier,
    };
