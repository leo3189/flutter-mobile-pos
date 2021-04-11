import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch_info.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 55)
class BranchInfo {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String name;
  @HiveField(3)
  String street;
  @HiveField(4)
  String city;
  @HiveField(5)
  String state;
  @HiveField(6)
  String country;
  @HiveField(7)
  String zip;
  @HiveField(8)
  String website;
  @HiveField(9)
  String email;
  @HiveField(10)
  String phone;
  @HiveField(11)
  String fax;
  @HiveField(12)
  String imageID;
  @HiveField(13)
  int status;
  @HiveField(14)
  bool isParent;
  @HiveField(15)
  bool isDeleted;
  @HiveField(16)
  bool doAutoCloseOut;
  @HiveField(17)
  String autoCloseOutTime;
  @HiveField(18)
  String poPrefix;
  @HiveField(19)
  double latitude;
  @HiveField(20)
  double longitude;
  @HiveField(21)
  List<OpenDays> openDays;
  @HiveField(22)
  List<AdImage> adImages;

  BranchInfo(
    this.id,
    this.companyID,
    this.name,
    this.street,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.website,
    this.email,
    this.phone,
    this.fax,
    this.imageID,
    this.status,
    this.isParent,
    this.isDeleted,
    this.doAutoCloseOut,
    this.autoCloseOutTime,
    this.poPrefix,
    this.latitude,
    this.longitude,
    this.openDays,
    this.adImages
  );

  factory BranchInfo.fromJson(Map<String, dynamic> json) => _$BranchInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BranchInfoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 56)
class OpenDays {
  @HiveField(0)
  String branchId;
  @HiveField(1)
  int day;
  @HiveField(2)
  String end;
  @HiveField(3)
  int id;
  @HiveField(4)
  String start;
  @HiveField(5)
  bool isEnabled;

  OpenDays(
    this.branchId,
    this.day,
    this.end,
    this.id,
    this.start,
    this.isEnabled
  );

  factory OpenDays.fromJson(Map<String, dynamic> json) => _$OpenDaysFromJson(json);
  Map<String, dynamic> toJson() => _$OpenDaysToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 57)
class AdImage {
  @HiveField(0)
  String branchId;
  @HiveField(1)
  int imageId;

  AdImage(
    this.branchId,
    this.imageId
  );

  factory AdImage.fromJson(Map<String, dynamic> json) => _$AdImageFromJson(json);
  Map<String, dynamic> toJson() => _$AdImageToJson(this);
}