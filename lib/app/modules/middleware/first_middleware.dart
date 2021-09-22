import 'package:chicktok/app/modules/login/controllers/login_controller.dart';
import 'package:chicktok/main.dart';
import 'package:flutter/material.dart';
import 'package:chicktok/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FirstMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;
  bool isAuthenticated = false;
  // final authController = Get.find<LoginController>();
  LoginController authController = Get.put(LoginController());

  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<LoginController>();
    // if (isAuthenticated == false) {
    //   // print('not logged in from middleware');
    //   return RouteSettings(name: Routes.LOGIN);
    // }

    // if (Get.find<>authController.isLoggedin) == false) {
    // if (controller.isConnected.value == false) {
    //   // print('not logged in from middleware');

    //   // print('login ${authController.isLoggedin.toString()}');
    //   print('login ${controller.isConnected.value.toString()}');

    //   return RouteSettings(name: Routes.LOGIN);
    // } else {
    //   // print('login ${authController.isLoggedin.toString()}');
    //   return RouteSettings(name: Routes.PRODUCTS);
    // }
  }

  // set updateIsAuthenticated(bool val) => val;

  //This function will be called before anything created we can use it to change something about the page or give it new page
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  //This function will be called right before the bindings are initialized.
  //Here we can change bindings for htis page
  @override
  List<Bindings>? onBindingStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //this function will be called right after the bindings are nitialized.
  //here we can do something after bindings created and before creating the page
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  //Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //this function will be called right after disposing all the related objects
  @override
  void onPageDispose() {
    super.onPageDispose();
  }
}
