import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var tabIndex = 0.obs;
  var pageController = PageController(initialPage: 0).obs;

  onPageChanged(int index) {
    tabIndex.value = index;
    // update();
  }

  onItemTapped(int index) {
    tabIndex.value = index;
    pageController.value.jumpToPage(index);
    print(pageController.value.page);
    print(tabIndex.value);
    // update();
  }



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
