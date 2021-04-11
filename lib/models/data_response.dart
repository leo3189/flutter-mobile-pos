import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DataResponse {
  int code;
	String message;
	dynamic data;

  DataResponse(
    this.code,
    this.message,
    this.data
  );

  factory DataResponse.fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}