// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantListAdapter extends TypeAdapter<VariantList> {
  @override
  final int typeId = 38;

  @override
  VariantList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantList(
      fields[0] as int,
      fields[1] as bool,
      fields[2] as dynamic,
      fields[3] as String,
      fields[4] as int,
      fields[5] as bool,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as int,
      (fields[9] as List)?.cast<VariantListNameList>(),
    );
  }

  @override
  void write(BinaryWriter writer, VariantList obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isParent)
      ..writeByte(2)
      ..write(obj.parentId)
      ..writeByte(3)
      ..write(obj.branchId)
      ..writeByte(4)
      ..write(obj.variantGroupID)
      ..writeByte(5)
      ..write(obj.isEnabled)
      ..writeByte(6)
      ..write(obj.companyID)
      ..writeByte(7)
      ..write(obj.isDeleted)
      ..writeByte(8)
      ..write(obj.orderIndex)
      ..writeByte(9)
      ..write(obj.nameList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantListNameListAdapter extends TypeAdapter<VariantListNameList> {
  @override
  final int typeId = 37;

  @override
  VariantListNameList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantListNameList(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as dynamic,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VariantListNameList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.variantID)
      ..writeByte(2)
      ..write(obj.languageID)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.shortName)
      ..writeByte(5)
      ..write(obj.orderIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantListNameListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantList _$VariantListFromJson(Map<String, dynamic> json) {
  return VariantList(
    json['id'] as int,
    json['isParent'] as bool,
    json['parentId'],
    json['branchId'] as String,
    json['variantGroupID'] as int,
    json['isEnabled'] as bool,
    json['companyID'] as String,
    json['isDeleted'] as bool,
    json['orderIndex'] as int,
    (json['nameList'] as List)
        ?.map((e) => e == null
            ? null
            : VariantListNameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VariantListToJson(VariantList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isParent': instance.isParent,
      'parentId': instance.parentId,
      'branchId': instance.branchId,
      'variantGroupID': instance.variantGroupID,
      'isEnabled': instance.isEnabled,
      'companyID': instance.companyID,
      'isDeleted': instance.isDeleted,
      'orderIndex': instance.orderIndex,
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
    };

VariantListNameList _$VariantListNameListFromJson(Map<String, dynamic> json) {
  return VariantListNameList(
    json['id'] as int,
    json['variantID'] as int,
    json['languageID'] as int,
    json['fullName'] as String,
    json['shortName'],
    json['orderIndex'] as int,
  );
}

Map<String, dynamic> _$VariantListNameListToJson(
        VariantListNameList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantID': instance.variantID,
      'languageID': instance.languageID,
      'fullName': instance.fullName,
      'shortName': instance.shortName,
      'orderIndex': instance.orderIndex,
    };
