import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xpress_mobile_pos/helpers/database_helper.dart';
import 'package:xpress_mobile_pos/helpers/sp_helper.dart';
import 'package:xpress_mobile_pos/pages/checkout_page.dart';
import 'package:xpress_mobile_pos/pages/home_page.dart';
import 'package:xpress_mobile_pos/pages/load_data_page.dart';
import 'package:xpress_mobile_pos/pages/login_page.dart';
import 'package:xpress_mobile_pos/pages/order_page.dart';
import 'package:xpress_mobile_pos/pages/settings/setting_page.dart';
import 'package:xpress_mobile_pos/providers/cart_provider.dart';
import 'package:xpress_mobile_pos/providers/payment_provider.dart';
import 'package:xpress_mobile_pos/providers/setting_provider.dart';

void main() {
  DatabaseHelper.instance.init();
  SpHelper.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => SettingProvider())
      ],
      child: ScreenUtilInit(
        designSize: Size(2048, 1536),
        allowFontScaling: false,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SpHelper.getBool('isLogin') ? LoadData() : LoginPage(),
            '/loadData': (context) => LoadData(),
            '/home': (context) => HomePage(),
            '/order': (context) => OrderPage(),
            '/checkout': (context) => CheckoutPage(),
            '/setting': (context) => SettingPage()
          },
        ),
      ),
    );
  }
}



 
