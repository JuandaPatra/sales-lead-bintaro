import 'package:flutter_sales_lead/pages/dashboard.dart';
import 'package:get/get.dart';
import './route_names.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.home, page: () => DashboardPage()),
    GetPage(name: RouteName.add, page: () => DashboardPage()),
    GetPage(name: RouteName.profile, page: () => DashboardPage()),
  ];
}
