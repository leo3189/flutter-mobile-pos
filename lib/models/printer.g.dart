// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrinterAdapter extends TypeAdapter<Printer> {
  @override
  final int typeId = 50;

  @override
  Printer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Printer(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as bool,
      (fields[6] as List)?.cast<PrinterLanguage>(),
      (fields[7] as List)?.cast<PrinterOrderType>(),
    );
  }

  @override
  void write(BinaryWriter writer, Printer obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.branchID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.virtualReceiptID)
      ..writeByte(4)
      ..write(obj.copies)
      ..writeByte(5)
      ..write(obj.selfOrderPrinter)
      ..writeByte(6)
      ..write(obj.languages)
      ..writeByte(7)
      ..write(obj.orderTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrinterLanguageAdapter extends TypeAdapter<PrinterLanguage> {
  @override
  final int typeId = 52;

  @override
  PrinterLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrinterLanguage(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PrinterLanguage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.printerID)
      ..writeByte(1)
      ..write(obj.languageID)
      ..writeByte(2)
      ..write(obj.orderIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrinterOrderTypeAdapter extends TypeAdapter<PrinterOrderType> {
  @override
  final int typeId = 53;

  @override
  PrinterOrderType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrinterOrderType(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PrinterOrderType obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.printerID)
      ..writeByte(1)
      ..write(obj.orderTypeID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterOrderTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Printer _$PrinterFromJson(Map<String, dynamic> json) {
  return Printer(
    json['id'] as String,
    json['branchID'] as String,
    json['name'] as String,
    json['virtualReceiptID'] as String,
    json['copies'] as int,
    json['selfOrderPrinter'] as bool,
    (json['languages'] as List)
        ?.map((e) => e == null
            ? null
            : PrinterLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['orderTypes'] as List)
        ?.map((e) => e == null
            ? null
            : PrinterOrderType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PrinterToJson(Printer instance) => <String, dynamic>{
      'id': instance.id,
      'branchID': instance.branchID,
      'name': instance.name,
      'virtualReceiptID': instance.virtualReceiptID,
      'copies': instance.copies,
      'selfOrderPrinter': instance.selfOrderPrinter,
      'languages': instance.languages?.map((e) => e?.toJson())?.toList(),
      'orderTypes': instance.orderTypes?.map((e) => e?.toJson())?.toList(),
    };

PrinterLanguage _$PrinterLanguageFromJson(Map<String, dynamic> json) {
  return PrinterLanguage(
    json['printerID'] as String,
    json['languageID'] as int,
    json['orderIndex'] as int,
  );
}

Map<String, dynamic> _$PrinterLanguageToJson(PrinterLanguage instance) =>
    <String, dynamic>{
      'printerID': instance.printerID,
      'languageID': instance.languageID,
      'orderIndex': instance.orderIndex,
    };

PrinterOrderType _$PrinterOrderTypeFromJson(Map<String, dynamic> json) {
  return PrinterOrderType(
    json['printerID'] as String,
    json['orderTypeID'] as int,
  );
}

Map<String, dynamic> _$PrinterOrderTypeToJson(PrinterOrderType instance) =>
    <String, dynamic>{
      'printerID': instance.printerID,
      'orderTypeID': instance.orderTypeID,
    };
