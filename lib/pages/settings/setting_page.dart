import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile_pos/pages/settings/setting_printer.dart';
import 'package:flutter_mobile_pos/providers/setting_provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SettingProvider>(context, listen: false).getAllPrinters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  var _selectedSetting = 0;
  var _settingPages = [
    SettingPrinterPage()
  ];
  var _controller = PageController(initialPage: 0);

  void _selectSetting(int index) {
    _selectedSetting = index;

    _controller.animateToPage(
      index, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.ease
    );
  }

  @override
  Widget build(BuildContext context) {
    var _settings = context.watch<SettingProvider>().settingItems;

    return Row(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(237, 239, 239, 1),
          width: ScreenUtil().setWidth(600),
          child: ListView.builder(
            itemCount: _settings.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _selectSetting(index);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(48),
                    top: ScreenUtil().setWidth(48),
                  ),
                  color: _selectedSetting == index 
                    ? Theme.of(context).accentColor
                    : null,
                  height: ScreenUtil().setHeight(138),
                  child: Text(
                    _settings[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(36),
                      color: _selectedSetting == index
                        ? Colors.white
                        : Theme.of(context).accentColor
                    ),
                  ),
                ),
              );
            }
          ),
        ),
        Expanded(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: _settingPages.length,
            itemBuilder: (context, index) {
              return _settingPages[index];
            }
          )
        )
      ],
    );
  }
}