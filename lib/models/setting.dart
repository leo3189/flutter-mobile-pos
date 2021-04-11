import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

class Setting {
  List<SettingPrinter> printers;
}

@JsonSerializable()
class SettingPrinter {
  String id;
  String name;
  String ip;

  SettingPrinter({
    this.id,
    this.name,
    this.ip = ''
  });

  factory SettingPrinter.fromJson(Map<String, dynamic> json) => _$SettingPrinterFromJson(json);
  Map<String, dynamic> toJson() => _$SettingPrinterToJson(this);
}