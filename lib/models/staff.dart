import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xpress_mobile_pos/models/staff_type.dart';

part 'staff.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 41)
class Staff {
  @HiveField(0)
  int id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String branchID;
  @HiveField(3)
  String nickName;
  @HiveField(4)
  String firstName;
  @HiveField(5)
  String lastName;
  @HiveField(6)
  bool onlineStatus;
  @HiveField(7)
  int imageID;
  @HiveField(8)
  String fileID;
  @HiveField(9)
  String ssn;
  @HiveField(10)
  String street;
  @HiveField(11)
  String city;
  @HiveField(12)
  String state;
  @HiveField(13)
  String postalCode;
  @HiveField(14)
  String phone;
  @HiveField(15)
  String email;
  @HiveField(16)
  String posPin;
  @HiveField(17)
  double salary;
  @HiveField(18)
  String salaryType;
  @HiveField(19)
  double otRate;
  @HiveField(20)
  String employeeCard;
  @HiveField(21)
  String note;
  @HiveField(22)
  String dob;
  @HiveField(23)
  String createdDate;
  @HiveField(24)
  String lastUpdate;
  @HiveField(25)
  bool isUsingFingerprint;
  @HiveField(26)
  String referBy;
  @HiveField(27)
  bool active;
  @HiveField(28)
  bool isDeleted;
  @HiveField(29)
  bool isNeedClockIn;
  @HiveField(30)
  bool isSuperUser;
  @HiveField(31)
  bool isSelfOrderUser;
  @HiveField(32)
  List<StaffPermissionList> permissionsList;
  @HiveField(33)
  List<StaffShift> shifts;
  @HiveField(34)
  List<StaffAttendance> attendances;
  @HiveField(35)
  List<StaffShiftSetting> shiftSettings;

  Staff(
    this.id,
    this.companyID,
    this.branchID,
    this.nickName,
    this.firstName,
    this.lastName,
    this.onlineStatus,
    this.imageID,
    this.fileID,
    this.ssn,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.phone,
    this.email,
    this.posPin,
    this.salary,
    this.salaryType,
    this.otRate,
    this.employeeCard,
    this.note,
    this.dob,
    this.createdDate,
    this.lastUpdate,
    this.isUsingFingerprint,
    this.referBy,
    this.active,
    this.isDeleted,
    this.isNeedClockIn,
    this.isSelfOrderUser,
    this.isSuperUser,
    this.permissionsList,
    this.shifts,
    this.shiftSettings,
    this.attendances
  );

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  Map<String, dynamic> toJson() => _$StaffToJson(this);
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 42)
class StaffPermissionList {
  @HiveField(0)
  int staffID;
  @HiveField(1)
  int staffTypeID;
  @HiveField(2)
  StaffType staffType;

  StaffPermissionList(
    this.staffID,
    this.staffTypeID,
    this.staffType
  );

  factory StaffPermissionList.fromJson(Map<String, dynamic> json) => _$StaffPermissionListFromJson(json);
  Map<String, dynamic> toJson() => _$StaffPermissionListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 43)
class StaffShift {
  @HiveField(0)
  String id;
  @HiveField(1)
  String start;
  @HiveField(2)
  String end;
  @HiveField(3)
  String title;
  @HiveField(4)
  String color;
  @HiveField(5)
  bool allDay;
  @HiveField(6)
  bool customValue;
  @HiveField(7)
  int staffTypeID;
  @HiveField(8)
  int staffID;
  @HiveField(9)
  String branchID;
  @HiveField(10)
  String shiftTypeID;

  StaffShift(
    this.id,
    this.start,
    this.end,
    this.title,
    this.color,
    this.allDay,
    this.customValue,
    this.staffTypeID,
    this.staffID,
    this.branchID,
    this.shiftTypeID
  );

  factory StaffShift.fromJson(Map<String, dynamic> json) => _$StaffShiftFromJson(json);
  Map<String, dynamic> toJson() => _$StaffShiftToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 44)
class StaffAttendance {
  @HiveField(0)
  int staffID;
  @HiveField(1)
  String shiftID;
  @HiveField(2)
  String clockTime;
  @HiveField(3)
  bool isOtRequest;
  @HiveField(4)
  bool isClockIn;

  StaffAttendance(
    this.staffID,
    this.shiftID,
    this.clockTime,
    this.isOtRequest,
    this.isClockIn
  );

  factory StaffAttendance.fromJson(Map<String, dynamic> json) => _$StaffAttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$StaffAttendanceToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 45)
class StaffShiftSetting {
  @HiveField(0)
  int staffID;
  @HiveField(1)
  int shiftSettingID;

  StaffShiftSetting(
    this.staffID,
    this.shiftSettingID
  );

  factory StaffShiftSetting.fromJson(Map<String, dynamic> json) => _$StaffShiftSettingFromJson(json);
  Map<String, dynamic> toJson() => _$StaffShiftSettingToJson(this);
}
