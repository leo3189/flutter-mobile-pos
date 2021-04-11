import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
	int code;
	String message;
	LoginResponseData data;

  LoginResponse(
    this.code,
    this.message,
    this.data
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResponseData {
	String token;
  User user;

  LoginResponseData(
    this.token,
    this.user
  );

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}

@JsonSerializable()
class User {
  String id;
  String companyId;
  List<Branch> branches;

  User(this.id, this.companyId, this.branches);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Branch {
  String userId;
  String branchId;
  String id;
  String name;
  bool isCompany;

  Branch(
    this.userId,
    this.branchId,
    this.id,
    this.name,
    this.isCompany
  );

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
