// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchInfoAdapter extends TypeAdapter<BranchInfo> {
  @override
  final int typeId = 55;

  @override
  BranchInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchInfo(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as int,
      fields[14] as bool,
      fields[15] as bool,
      fields[16] as bool,
      fields[17] as String,
      fields[18] as String,
      fields[19] as double,
      fields[20] as double,
      (fields[21] as List)?.cast<OpenDays>(),
      (fields[22] as List)?.cast<AdImage>(),
    );
  }

  @override
  void write(BinaryWriter writer, BranchInfo obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.street)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.zip)
      ..writeByte(8)
      ..write(obj.website)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.fax)
      ..writeByte(12)
      ..write(obj.imageID)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.isParent)
      ..writeByte(15)
      ..write(obj.isDeleted)
      ..writeByte(16)
      ..write(obj.doAutoCloseOut)
      ..writeByte(17)
      ..write(obj.autoCloseOutTime)
      ..writeByte(18)
      ..write(obj.poPrefix)
      ..writeByte(19)
      ..write(obj.latitude)
      ..writeByte(20)
      ..write(obj.longitude)
      ..writeByte(21)
      ..write(obj.openDays)
      ..writeByte(22)
      ..write(obj.adImages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OpenDaysAdapter extends TypeAdapter<OpenDays> {
  @override
  final int typeId = 56;

  @override
  OpenDays read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpenDays(
      fields[0] as String,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
      fields[4] as String,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OpenDays obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.branchId)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.start)
      ..writeByte(5)
      ..write(obj.isEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpenDaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdImageAdapter extends TypeAdapter<AdImage> {
  @override
  final int typeId = 57;

  @override
  AdImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdImage(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AdImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.branchId)
      ..writeByte(1)
      ..write(obj.imageId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchInfo _$BranchInfoFromJson(Map<String, dynamic> json) {
  return BranchInfo(
    json['id'] as String,
    json['companyID'] as String,
    json['name'] as String,
    json['street'] as String,
    json['city'] as String,
    json['state'] as String,
    json['country'] as String,
    json['zip'] as String,
    json['website'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['fax'] as String,
    json['imageID'] as String,
    json['status'] as int,
    json['isParent'] as bool,
    json['isDeleted'] as bool,
    json['doAutoCloseOut'] as bool,
    json['autoCloseOutTime'] as String,
    json['poPrefix'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    (json['openDays'] as List)
        ?.map((e) =>
            e == null ? null : OpenDays.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['adImages'] as List)
        ?.map((e) =>
            e == null ? null : AdImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BranchInfoToJson(BranchInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'name': instance.name,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zip': instance.zip,
      'website': instance.website,
      'email': instance.email,
      'phone': instance.phone,
      'fax': instance.fax,
      'imageID': instance.imageID,
      'status': instance.status,
      'isParent': instance.isParent,
      'isDeleted': instance.isDeleted,
      'doAutoCloseOut': instance.doAutoCloseOut,
      'autoCloseOutTime': instance.autoCloseOutTime,
      'poPrefix': instance.poPrefix,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'openDays': instance.openDays?.map((e) => e?.toJson())?.toList(),
      'adImages': instance.adImages?.map((e) => e?.toJson())?.toList(),
    };

OpenDays _$OpenDaysFromJson(Map<String, dynamic> json) {
  return OpenDays(
    json['branchId'] as String,
    json['day'] as int,
    json['end'] as String,
    json['id'] as int,
    json['start'] as String,
    json['isEnabled'] as bool,
  );
}

Map<String, dynamic> _$OpenDaysToJson(OpenDays instance) => <String, dynamic>{
      'branchId': instance.branchId,
      'day': instance.day,
      'end': instance.end,
      'id': instance.id,
      'start': instance.start,
      'isEnabled': instance.isEnabled,
    };

AdImage _$AdImageFromJson(Map<String, dynamic> json) {
  return AdImage(
    json['branchId'] as String,
    json['imageId'] as int,
  );
}

Map<String, dynamic> _$AdImageToJson(AdImage instance) => <String, dynamic>{
      'branchId': instance.branchId,
      'imageId': instance.imageId,
    };
