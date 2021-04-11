// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantGroupAdapter extends TypeAdapter<VariantGroup> {
  @override
  final int typeId = 36;

  @override
  VariantGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantGroup(
      fields[0] as int,
      fields[1] as dynamic,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
      fields[5] as String,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as bool,
      fields[9] as int,
      (fields[10] as List)?.cast<VariantList>(),
      (fields[11] as List)?.cast<VariantGroupsNameList>(),
    );
  }

  @override
  void write(BinaryWriter writer, VariantGroup obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.branchId)
      ..writeByte(3)
      ..write(obj.companyID)
      ..writeByte(4)
      ..write(obj.isDeleted)
      ..writeByte(5)
      ..write(obj.icon)
      ..writeByte(6)
      ..write(obj.unicode)
      ..writeByte(7)
      ..write(obj.isParent)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.orderIndex)
      ..writeByte(10)
      ..write(obj.variantList)
      ..writeByte(11)
      ..write(obj.nameList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantGroupsNameListAdapter extends TypeAdapter<VariantGroupsNameList> {
  @override
  final int typeId = 35;

  @override
  VariantGroupsNameList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantGroupsNameList(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as dynamic,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VariantGroupsNameList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.variantGroupID)
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
      other is VariantGroupsNameListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantGroup _$VariantGroupFromJson(Map<String, dynamic> json) {
  return VariantGroup(
    json['id'] as int,
    json['parentId'],
    json['branchId'] as String,
    json['companyID'] as String,
    json['isDeleted'] as bool,
    json['icon'] as String,
    json['unicode'] as String,
    json['isParent'] as bool,
    json['isActive'] as bool,
    json['orderIndex'] as int,
    (json['variantList'] as List)
        ?.map((e) =>
            e == null ? null : VariantList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['nameList'] as List)
        ?.map((e) => e == null
            ? null
            : VariantGroupsNameList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VariantGroupToJson(VariantGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'branchId': instance.branchId,
      'companyID': instance.companyID,
      'isDeleted': instance.isDeleted,
      'icon': instance.icon,
      'unicode': instance.unicode,
      'isParent': instance.isParent,
      'isActive': instance.isActive,
      'orderIndex': instance.orderIndex,
      'variantList': instance.variantList?.map((e) => e?.toJson())?.toList(),
      'nameList': instance.nameList?.map((e) => e?.toJson())?.toList(),
    };

VariantGroupsNameList _$VariantGroupsNameListFromJson(
    Map<String, dynamic> json) {
  return VariantGroupsNameList(
    json['id'] as int,
    json['variantGroupID'] as int,
    json['languageID'] as int,
    json['fullName'] as String,
    json['shortName'],
    json['orderIndex'] as int,
  );
}

Map<String, dynamic> _$VariantGroupsNameListToJson(
        VariantGroupsNameList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantGroupID': instance.variantGroupID,
      'languageID': instance.languageID,
      'fullName': instance.fullName,
      'shortName': instance.shortName,
      'orderIndex': instance.orderIndex,
    };
