import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var tabIndex = 0.obs;
  // final PageController pageController = PageController(initialPage: 0);
  var pageController = PageController(initialPage: 0).obs;

//  PageController controller = PageController(initialPage: 0);

  onPageChanged(int index) {
    tabIndex.value = index;
  }

  onItemTapped(int index) {
    // tabIndex.value = index;
    pageController.value.jumpToPage(index);
    // print(tabIndex.value);
    print(pageController.value.page);
  }

  test() {
    print('fdf');
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
