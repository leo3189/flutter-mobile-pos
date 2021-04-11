import 'package:dio/dio.dart';
import 'package:xpress_mobile_pos/services/data_service.dart';
import 'package:xpress_mobile_pos/services/sync_data_service.dart';

import 'login_service.dart';

class ApiService {
  Dio dio;
  String basePath = "https://xpress.qaapi.abcpos.com/api/v1";
  // String basePath = "http://192.168.86.129:5005/api/v1";

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