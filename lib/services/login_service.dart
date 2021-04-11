import 'dart:convert';

import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<Response>login(Map<String, String> loginDto) async {
    String _path = '/login';

    Map<String, String> headerParams = {
      "device_type": "mobile_pos"
    };
    dynamic bodyData = jsonEncode(loginDto);

    return _dio.request(
      _path,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams
      )
    );
  }
}