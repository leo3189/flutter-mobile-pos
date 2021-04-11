import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_seq.g.dart';

@JsonSerializable()
@HiveType(typeId: 39)
class DailySeq {
  @HiveField(0)
  int id;
  @HiveField(1)
  int seqNum;
  @HiveField(2)
  int orderType;
  @HiveField(3)
  DateTime lastUpdate;

  DailySeq({
    this.id,
    this.seqNum,
    this.orderType,
    this.lastUpdate
  });

  factory DailySeq.fromJson(Map<String, dynamic> json) => _$DailySeqFromJson(json);
  Map<String, dynamic> toJson() => _$DailySeqToJson(this);
}