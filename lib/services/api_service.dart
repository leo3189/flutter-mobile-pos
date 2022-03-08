import 'package:dio/dio.dart';
import 'package:flutter_mobile_pos/services/data_service.dart';
import 'package:flutter_mobile_pos/services/sync_data_service.dart';

import 'login_service.dart';

class ApiService {
  Dio dio;
  String basePath = "http://localhost/api/v1";

  ApiService({ this.dio }) {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: basePath,
        connectTimeout: 5000,
        receiveTimeout: 3000
      );
      this.dio = new Dio(options);
    }
  }

  LoginService loginApi() {
    return LoginService(dio);
  }

  DataService dataApi() {
    return DataService(dio);
  }

  SyncDataService syncDataApi() {
    return SyncDataService(dio);
  }
}