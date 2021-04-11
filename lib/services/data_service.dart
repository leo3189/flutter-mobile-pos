import 'package:dio/dio.dart';

class DataService {
  final Dio _dio;

  DataService(this._dio);

  Future<Response>getDatas({String companyId, String branchId}) async {
    String _path = '/datas';

    Map<String, String> headerParams = {
      "company_id": companyId
    };
    Map<String, dynamic> queryParams = {
      "branch_id": branchId
    };

    return _dio.request(
      _path,
      queryParameters: queryParams,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams
      )
    );
  }
}