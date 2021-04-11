import 'package:flutter/material.dart';
import 'package:xpress_mobile_pos/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingPrinterPage extends StatefulWidget {
  @override
  _SettingPrinterPageState createState() => _SettingPrinterPageState();
}

class _SettingPrinterPageState extends State<SettingPrinterPage> {
  @override
  Widget build(BuildContext context) {
    var printers = context.watch<SettingProvider>().printers;
    
     return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: printers.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(printers[index].name)
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController.fromValue(
                            TextEditingValue(
                              text: printers[index].ip,
                            )
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '192.168.0.0',
                            border: InputBorder.none
                          ),
                          onChanged: (String value) {
                            printers[index].ip = value;
                          },
                        )
                      )
                    ],
                  ),
                );
              }
            ),
          ),
          ElevatedButton(
            onPressed: () => Provider.of<SettingProvider>(context, listen: false).savePrinters(), 
            child: Text('Save')
          ),
        ],
      )
    );
  }
}