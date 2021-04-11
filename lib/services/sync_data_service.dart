import 'dart:convert';

import 'package:dio/dio.dart';

class SyncDataService {
  final Dio _dio;

  SyncDataService(this._dio);

  Future<Response>sync(Map<String, dynamic> syncDto) async {
    String _path = '/sync-data';

    dynamic bodyData = jsonEncode(syncDto);

    return _dio.request(
      _path,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
      )
    );
  }
}