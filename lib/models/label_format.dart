import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'label_format.g.dart';

@JsonSerializable()
@HiveType(typeId: 49)
class LabelFormat {
  @HiveField(0)
  String id;
  @HiveField(1)
  String companyId;
  @HiveField(2)
  bool showHeader;
  @HiveField(3)
  int orderNumberSize;
  @HiveField(4)
  bool showLogo;
  @HiveField(5)
  bool showOrderTime;
  @HiveField(6)
  int orderTimeSize;
  @HiveField(7)
  bool dividedLine;
  @HiveField(8)
  bool showOrderType;
  @HiveField(9)
  bool cutomerInfo;
  @HiveField(10)
  bool showBody;
  @HiveField(11)
  bool itemAbbreviate;
  @HiveField(12)
  bool modifierAbbreviate;
  @HiveField(13)
  bool showPrice;
  @HiveField(14)
  bool showNumberOfOrder;
  @HiveField(15)
  bool showItemNotes;
  @HiveField(16)
  bool languageLayout;
  @HiveField(17)
  bool separateModifier;

  LabelFormat(
    this.id,
    this.companyId,
    this.showHeader,
    this.orderNumberSize,
    this.showLogo,
    this.showOrderTime,
    this.orderTimeSize,
    this.dividedLine,
    this.showOrderType,
    this.cutomerInfo,
    this.showBody,
    this.itemAbbreviate,
    this.modifierAbbreviate,
    this.showPrice,
    this.showNumberOfOrder,
    this.showItemNotes,
    this.languageLayout,
    this.separateModifier
  );

  factory LabelFormat.fromJson(Map<String, dynamic> json) => _$LabelFormatFromJson(json);
  Map<String, dynamic> toJson() => _$LabelFormatToJson(this);
}