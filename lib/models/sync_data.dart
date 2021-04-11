import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sync_data.g.dart';

@JsonSerializable()
@HiveType(typeId: 40)
class SyncData {
  @HiveField(0)
  String id;
  @HiveField(1)
  String action;
  @HiveField(2)
  String data;
  @HiveField(3)
  bool isUploaded;
  @HiveField(4)
  DateTime lastUpdate;
  @HiveField(5)
  int status;

  SyncData({
    this.id,
    this.action,
    this.data,
    this.isUploaded,
    this.lastUpdate,
    this.status
  });

  factory SyncData.fromJson(Map<String, dynamic> json) => _$SyncDataFromJson(json);
  Map<String, dynamic> toJson() => _$SyncDataToJson(this);
}