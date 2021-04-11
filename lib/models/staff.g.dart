// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StaffAdapter extends TypeAdapter<Staff> {
  @override
  final int typeId = 41;

  @override
  Staff read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Staff(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as bool,
      fields[7] as int,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
      fields[15] as String,
      fields[16] as String,
      fields[17] as double,
      fields[18] as String,
      fields[19] as double,
      fields[20] as String,
      fields[21] as String,
      fields[22] as String,
      fields[23] as String,
      fields[24] as String,
      fields[25] as bool,
      fields[26] as String,
      fields[27] as bool,
      fields[28] as bool,
      fields[29] as bool,
      fields[31] as bool,
      fields[30] as bool,
      (fields[32] as List)?.cast<StaffPermissionList>(),
      (fields[33] as List)?.cast<StaffShift>(),
      (fields[35] as List)?.cast<StaffShiftSetting>(),
      (fields[34] as List)?.cast<StaffAttendance>(),
    );
  }

  @override
  void write(BinaryWriter writer, Staff obj) {
    writer
      ..writeByte(36)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyID)
      ..writeByte(2)
      ..write(obj.branchID)
      ..writeByte(3)
      ..write(obj.nickName)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.onlineStatus)
      ..writeByte(7)
      ..write(obj.imageID)
      ..writeByte(8)
      ..write(obj.fileID)
      ..writeByte(9)
      ..write(obj.ssn)
      ..writeByte(10)
      ..write(obj.street)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.state)
      ..writeByte(13)
      ..write(obj.postalCode)
      ..writeByte(14)
      ..write(obj.phone)
      ..writeByte(15)
      ..write(obj.email)
      ..writeByte(16)
      ..write(obj.posPin)
      ..writeByte(17)
      ..write(obj.salary)
      ..writeByte(18)
      ..write(obj.salaryType)
      ..writeByte(19)
      ..write(obj.otRate)
      ..writeByte(20)
      ..write(obj.employeeCard)
      ..writeByte(21)
      ..write(obj.note)
      ..writeByte(22)
      ..write(obj.dob)
      ..writeByte(23)
      ..write(obj.createdDate)
      ..writeByte(24)
      ..write(obj.lastUpdate)
      ..writeByte(25)
      ..write(obj.isUsingFingerprint)
      ..writeByte(26)
      ..write(obj.referBy)
      ..writeByte(27)
      ..write(obj.active)
      ..writeByte(28)
      ..write(obj.isDeleted)
      ..writeByte(29)
      ..write(obj.isNeedClockIn)
      ..writeByte(30)
      ..write(obj.isSuperUser)
      ..writeByte(31)
      ..write(obj.isSelfOrderUser)
      ..writeByte(32)
      ..write(obj.permissionsList)
      ..writeByte(33)
      ..write(obj.shifts)
      ..writeByte(34)
      ..write(obj.attendances)
      ..writeByte(35)
      ..write(obj.shiftSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffPermissionListAdapter extends TypeAdapter<StaffPermissionList> {
  @override
  final int typeId = 42;

  @override
  StaffPermissionList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffPermissionList(
      fields[0] as int,
      fields[1] as int,
      fields[2] as StaffType,
    );
  }

  @override
  void write(BinaryWriter writer, StaffPermissionList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.staffID)
      ..writeByte(1)
      ..write(obj.staffTypeID)
      ..writeByte(2)
      ..write(obj.staffType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffPermissionListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffShiftAdapter extends TypeAdapter<StaffShift> {
  @override
  final int typeId = 43;

  @override
  StaffShift read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffShift(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as bool,
      fields[7] as int,
      fields[8] as int,
      fields[9] as String,
      fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StaffShift obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.allDay)
      ..writeByte(6)
      ..write(obj.customValue)
      ..writeByte(7)
      ..write(obj.staffTypeID)
      ..writeByte(8)
      ..write(obj.staffID)
      ..writeByte(9)
      ..write(obj.branchID)
      ..writeByte(10)
      ..write(obj.shiftTypeID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffShiftAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffAttendanceAdapter extends TypeAdapter<StaffAttendance> {
  @override
  final int typeId = 44;

  @override
  StaffAttendance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffAttendance(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StaffAttendance obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.staffID)
      ..writeByte(1)
      ..write(obj.shiftID)
      ..writeByte(2)
      ..write(obj.clockTime)
      ..writeByte(3)
      ..write(obj.isOtRequest)
      ..writeByte(4)
      ..write(obj.isClockIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffAttendanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StaffShiftSettingAdapter extends TypeAdapter<StaffShiftSetting> {
  @override
  final int typeId = 45;

  @override
  StaffShiftSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StaffShiftSetting(
      fields[0] as int,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StaffShiftSetting obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.staffID)
      ..writeByte(1)
      ..write(obj.shiftSettingID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaffShiftSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staff _$StaffFromJson(Map<String, dynamic> json) {
  return Staff(
    json['id'] as int,
    json['companyID'] as String,
    json['branchID'] as String,
    json['nickName'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['onlineStatus'] as bool,
    json['imageID'] as int,
    json['fileID'] as String,
    json['ssn'] as String,
    json['street'] as String,
    json['city'] as String,
    json['state'] as String,
    json['postalCode'] as String,
    json['phone'] as String,
    json['email'] as String,
    json['posPin'] as String,
    (json['salary'] as num)?.toDouble(),
    json['salaryType'] as String,
    (json['otRate'] as num)?.toDouble(),
    json['employeeCard'] as String,
    json['note'] as String,
    json['dob'] as String,
    json['createdDate'] as String,
    json['lastUpdate'] as String,
    json['isUsingFingerprint'] as bool,
    json['referBy'] as String,
    json['active'] as bool,
    json['isDeleted'] as bool,
    json['isNeedClockIn'] as bool,
    json['isSelfOrderUser'] as bool,
    json['isSuperUser'] as bool,
    (json['permissionsList'] as List)
        ?.map((e) => e == null
            ? null
            : StaffPermissionList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['shifts'] as List)
        ?.map((e) =>
            e == null ? null : StaffShift.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['shiftSettings'] as List)
        ?.map((e) => e == null
            ? null
            : StaffShiftSetting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['attendances'] as List)
        ?.map((e) => e == null
            ? null
            : StaffAttendance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'branchID': instance.branchID,
      'nickName': instance.nickName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'onlineStatus': instance.onlineStatus,
      'imageID': instance.imageID,
      'fileID': instance.fileID,
      'ssn': instance.ssn,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'phone': instance.phone,
      'email': instance.email,
      'posPin': instance.posPin,
      'salary': instance.salary,
      'salaryType': instance.salaryType,
      'otRate': instance.otRate,
      'employeeCard': instance.employeeCard,
      'note': instance.note,
      'dob': instance.dob,
      'createdDate': instance.createdDate,
      'lastUpdate': instance.lastUpdate,
      'isUsingFingerprint': instance.isUsingFingerprint,
      'referBy': instance.referBy,
      'active': instance.active,
      'isDeleted': instance.isDeleted,
      'isNeedClockIn': instance.isNeedClockIn,
      'isSuperUser': instance.isSuperUser,
      'isSelfOrderUser': instance.isSelfOrderUser,
      'permissionsList':
          instance.permissionsList?.map((e) => e?.toJson())?.toList(),
      'shifts': instance.shifts?.map((e) => e?.toJson())?.toList(),
      'attendances': instance.attendances?.map((e) => e?.toJson())?.toList(),
      'shiftSettings':
          instance.shiftSettings?.map((e) => e?.toJson())?.toList(),
    };

StaffPermissionList _$StaffPermissionListFromJson(Map<String, dynamic> json) {
  return StaffPermissionList(
    json['staffID'] as int,
    json['staffTypeID'] as int,
    json['staffType'] == null
        ? null
        : StaffType.fromJson(json['staffType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StaffPermissionListToJson(
        StaffPermissionList instance) =>
    <String, dynamic>{
      'staffID': instance.staffID,
      'staffTypeID': instance.staffTypeID,
      'staffType': instance.staffType?.toJson(),
    };

StaffShift _$StaffShiftFromJson(Map<String, dynamic> json) {
  return StaffShift(
    json['id'] as String,
    json['start'] as String,
    json['end'] as String,
    json['title'] as String,
    json['color'] as String,
    json['allDay'] as bool,
    json['customValue'] as bool,
    json['staffTypeID'] as int,
    json['staffID'] as int,
    json['branchID'] as String,
    json['shiftTypeID'] as String,
  );
}

Map<String, dynamic> _$StaffShiftToJson(StaffShift instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
      'color': instance.color,
      'allDay': instance.allDay,
      'customValue': instance.customValue,
      'staffTypeID': instance.staffTypeID,
      'staffID': instance.staffID,
      'branchID': instance.branchID,
      'shiftTypeID': instance.shiftTypeID,
    };

StaffAttendance _$StaffAttendanceFromJson(Map<String, dynamic> json) {
  return StaffAttendance(
    json['staffID'] as int,
    json['shiftID'] as String,
    json['clockTime'] as String,
    json['isOtRequest'] as bool,
    json['isClockIn'] as bool,
  );
}

Map<String, dynamic> _$StaffAttendanceToJson(StaffAttendance instance) =>
    <String, dynamic>{
      'staffID': instance.staffID,
      'shiftID': instance.shiftID,
      'clockTime': instance.clockTime,
      'isOtRequest': instance.isOtRequest,
      'isClockIn': instance.isClockIn,
    };

StaffShiftSetting _$StaffShiftSettingFromJson(Map<String, dynamic> json) {
  return StaffShiftSetting(
    json['staffID'] as int,
    json['shiftSettingID'] as int,
  );
}

Map<String, dynamic> _$StaffShiftSettingToJson(StaffShiftSetting instance) =>
    <String, dynamic>{
      'staffID': instance.staffID,
      'shiftSettingID': instance.shiftSettingID,
    };
