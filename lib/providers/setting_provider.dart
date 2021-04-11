import 'package:flutter/material.dart';
import 'package:xpress_mobile_pos/helpers/database_helper.dart';
import 'package:xpress_mobile_pos/helpers/sp_helper.dart';
import 'package:xpress_mobile_pos/models/setting.dart';

class SettingProvider extends ChangeNotifier {
  final List<String> settingItems = [
    'Printer',
    'Terminal'
  ];

  String selectedSetting = 'Printer';

  List<SettingPrinter> printers;

  Future getAllPrinters() async {
    printers = [];
    List<SettingPrinter> savedPrinters = SpHelper.getObjList('printers', (v) => SettingPrinter.fromJson(v), defValue: null);
    var dbPrinters = await DatabaseHelper.instance.getPrinters();
    dbPrinters.forEach((e) { 
      SettingPrinter p = SettingPrinter(
        id: e.id,
        name: e.name
      );
      if (savedPrinters != null) {
        var printer = savedPrinters.firstWhere((f) => f.id == p.id);
        p.ip = printer.ip;
      }
      printers.add(p);
    });
    notifyListeners();
  }

  void savePrinters() async {
    print(printers);
    SpHelper.putObjectList('printers', printers);
  }

  void deletePrinters() async {
    SpHelper.remove('printers');
  }
}