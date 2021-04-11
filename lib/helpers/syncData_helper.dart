import 'package:uuid/uuid.dart';
import 'package:xpress_mobile_pos/helpers/database_helper.dart';
import 'package:xpress_mobile_pos/models/data_response.dart';
import 'package:xpress_mobile_pos/models/sync_data.dart';
import 'package:xpress_mobile_pos/services/api_service.dart';

class SyncDataHelper {
  static createSyncData(String action, String object) async {
    SyncData syncData = new SyncData(
      id: Uuid().v1().toString(),
      action: action,
      data: object,
      status: 0,
      lastUpdate: DateTime.now()
    );
    var response = await DatabaseHelper.instance.insertSyncData(syncData.toJson());
    if (response) {
      var apiResponse = await ApiService().syncDataApi().sync(syncData.toJson());
      var result = DataResponse.fromJson(apiResponse.data);
      print(result);
    }
  }
}

class SyncDataAction {
  static const CREATE_ORDER = "CREATE_ORDER";
  static const UPDATE_ORDER = "UPDATE_ORDER";
  static const VOID_ORDER = "VOID_ORDER";
  static const REOPEN_ORDER = "REOPEN_ORDER";
  static const CREATE_INVOICE = "CREATE_INVOICE";
  static const CLOSE_DEPOSIT_INVOICE = "CLOSE_DEPOSIT_INVOICE";
  static const UPDATE_INVOICE = "UPDATE_INVOICE";
  static const CLOCK_IN_OUT = "CLOCK_IN_OUT";
  static const CREATE_CARD_ORDER = "CREATE_CARD_ORDER";
  static const CREATE_CARD_INVOICE = "CREATE_CARD_INVOICE";
  static const UPDATE_FLOOR_SECTION = "UPDATE_FLOOR_SECTION";
  static const CREATE_CREDIT_TRANSACTION = "CREATE_CREDIT_TRANSACTION";
  static const UPDATE_CREDIT_TRANSACTION = "UPDATE_CREDIT_TRANSACTION";
  static const CREATE_TABLE_ORDER_HISTORY = "CREATE_TABLE_ORDER_HISTORY";
  static const CREATE_CLOSE_OUT_HISTORY = "CREATE_CLOSE_OUT_HISTORY";
}