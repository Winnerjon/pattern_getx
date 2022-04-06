import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/pages/main_page.dart';
import 'package:pattern_getx/pages/payment_page.dart';
import 'package:pattern_getx/pages/setting_page.dart';
import 'package:pattern_getx/services/bind_service.dart';
import 'package:pattern_getx/services/di_service.dart';

Future main() async {
  await DIService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /// #for home page
      // home: HomePage(),

      /// #for main page
      // home: MainPage(),
      // initialBinding: ControllersBinding(),
      // getPages: [
      //   GetPage(
      //     name: MainPage.id,
      //     page: () => MainPage(),
      //     binding: ControllersBinding(),
      //   ),
      // ],

      /// #for payment page
      // home: PaymentPage(),
      // initialBinding: ControllersBinding(),

      /// #for payment page
      home: SettingPage(),
      // initialBinding: ControllersBinding(),
    );
  }
}
