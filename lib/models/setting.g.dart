// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingPrinter _$SettingPrinterFromJson(Map<String, dynamic> json) {
  return SettingPrinter(
    id: json['id'] as String,
    name: json['name'] as String,
    ip: json['ip'] as String,
  );
}

Map<String, dynamic> _$SettingPrinterToJson(SettingPrinter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ip': instance.ip,
    };
