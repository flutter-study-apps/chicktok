import 'package:get/get.dart';

import 'package:chicktok/app/modules/delivery/bindings/delivery_binding.dart';
import 'package:chicktok/app/modules/delivery/views/delivery_view.dart';
import 'package:chicktok/app/modules/home/bindings/home_binding.dart';
import 'package:chicktok/app/modules/home/views/home_view.dart';
import 'package:chicktok/app/modules/login/bindings/login_binding.dart';
import 'package:chicktok/app/modules/login/views/login_view.dart';
import 'package:chicktok/app/modules/middleware/first_middleware.dart';
import 'package:chicktok/app/modules/products/bindings/products_binding.dart';
import 'package:chicktok/app/modules/products/views/products_view.dart';
import 'package:chicktok/app/modules/report/bindings/report_binding.dart';
import 'package:chicktok/app/modules/report/views/report_view.dart';
import 'package:chicktok/app/modules/setting/bindings/setting_binding.dart';
import 'package:chicktok/app/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.LOGIN;
  // static const INITIAL = Routes.PRODUCTS;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      // middlewares: [FirstMiddleware()],
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
