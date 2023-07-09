import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_sales_lead/controller/userController.dart';
import 'package:flutter_sales_lead/screens/login_page.dart';
import 'package:flutter_sales_lead/widgets/theme.dart';
import './screens/homepage.dart';

import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final profileC = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(
        () => profileC.isLogin == true
            ? profileC.isTokenAuth == true
                ? MyHomePage()
                : LoginPage()
            : LoginPage(),
      ),
      theme: MyThemeData(),
    );
  }
}
