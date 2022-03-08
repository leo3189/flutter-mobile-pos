import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/widgets/pos_pin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _goToSetting() {
    Navigator.pushNamed(context, '/setting'); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: AppBody(),
    );
  }

  Widget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo-topleft.png')
              )
            ),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(20), 
              left: ScreenUtil().setWidth(40)
            ),
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(80),
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 42,
                color: Colors.white,
                icon: Icon(Icons.more_horiz),
                onPressed: _goToSetting
              ),
              IconButton(
                iconSize: 42,
                color: Colors.white,
                icon: Icon(Icons.settings),
                onPressed: _goToSetting
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  var isPosPin;

  void _logoutPressed() {
    SpHelper.putBool('posPin', false);
    SpHelper.remove('staff');
    setState(() {
      isPosPin = false;
    });
  }

   void _goTo() {
    var isLogin = SpHelper.getBool('posPin');
    if (isLogin) {
      Navigator.pushNamed(context, '/order'); 
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.grey,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 0,
          child: PosPin(),
        );
      }
    ).then((value) => {
      if (value) {
        Navigator.pushNamed(context, '/order')
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isPosPin = SpHelper.getBool('posPin');
  }

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      child: Container(
        child: Stack(
          children: <Widget>[
            // Offstage(
            //   offstage: isPosPin,
            //   child: Positioned(
            //     bottom: ScreenUtil().setHeight(50),
            //     left: ScreenUtil().setWidth(30),
            //     child: IconButton(
            //       iconSize: ScreenUtil().setSp(100),
            //       icon: Icon(
            //         IconData(0xF30B, fontFamily: 'AbcIcons'),
            //       ),
            //       onPressed: _logoutPressed,
            //     )
            //   )
            // ),
            Positioned(
              bottom: ScreenUtil().setHeight(50),
              left: ScreenUtil().setWidth(30),
              child: IconButton(
                iconSize: ScreenUtil().setSp(100),
                icon: Icon(
                  IconData(0xF30B, fontFamily: 'AbcIcons'),
                ),
                onPressed: _logoutPressed,
              )
            ),
            Container(
              child: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    height: ScreenUtil().setHeight(300),
                    width: ScreenUtil().setWidth(300),
                    child: Text(
                      'POS'
                    ),
                  ),
                  onTap: () => _goTo(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}