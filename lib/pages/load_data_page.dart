import 'package:flutter/material.dart';
import 'package:xpress_mobile_pos/helpers/database_helper.dart';
import 'package:xpress_mobile_pos/helpers/sp_helper.dart';
import 'package:xpress_mobile_pos/models/data_response.dart';
import 'package:xpress_mobile_pos/services/api_service.dart';

class LoadData extends StatefulWidget {
  @override
  _LoadDataState createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  final _api = ApiService();

  Future<void> _loadAndSaveData() async {
    var cid = SpHelper.getString('companyId');
    var bid = SpHelper.getString('branchId');
    try {
      var response = await _api.dataApi().getDatas(
        companyId: cid, 
        branchId: bid
      );
      var result = DataResponse.fromJson(response.data);
      print(result);
      await DatabaseHelper.instance.insertData(result.data);
      Navigator.pushNamed(context, '/home');
    } on Exception {
      print(Exception);
      Navigator.pushNamed(context, '/home');
    }
  } 

  @override
  void initState() {
    super.initState();
    _loadAndSaveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text('Loading Data...')
          ],
        )
      ),
    );
  }
}