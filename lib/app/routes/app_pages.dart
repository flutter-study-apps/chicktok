import 'package:get/get.dart';

import 'package:chicktok/app/modules/home/bindings/home_binding.dart';
import 'package:chicktok/app/modules/home/views/home_view.dart';
import 'package:chicktok/app/modules/login/bindings/login_binding.dart';
import 'package:chicktok/app/modules/login/views/login_view.dart';
import 'package:chicktok/app/modules/products/bindings/products_binding.dart';
import 'package:chicktok/app/modules/products/views/products_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
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
  ];
}
