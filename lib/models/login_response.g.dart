// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['code'] as int,
    json['message'] as String,
    json['data'] == null
        ? null
        : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) {
  return LoginResponseData(
    json['token'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['companyId'] as String,
    (json['branches'] as List)
        ?.map((e) =>
            e == null ? null : Branch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'branches': instance.branches,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    json['userId'] as String,
    json['branchId'] as String,
    json['id'] as String,
    json['name'] as String,
    json['isCompany'] as bool,
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'userId': instance.userId,
      'branchId': instance.branchId,
      'id': instance.id,
      'name': instance.name,
      'isCompany': instance.isCompany,
    };
