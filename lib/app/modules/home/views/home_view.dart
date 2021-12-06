import 'package:chicktok/app/modules/login/views/login_view.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/modules/products/views/products_view.dart';
import 'package:chicktok/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('HomeView ${controller.tabIndex.value}'),
            centerTitle: true,
          ),
          body: PageView(
            children: [
              ProductsView(),
              // ProductsView(),
              LoginView(),
              ProductsView(),
            ],
            controller: controller.pageController.value,
            // pageSnapping: false,
            // physics: NeverScrollableScrollPhysics(),

            onPageChanged: controller.onPageChanged(controller.tabIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.cyanAccent,
            unselectedItemColor: Colors.black,
            onTap: controller.onItemTapped,
            currentIndex: controller.tabIndex.value,
            selectedItemColor: Colors.amber[800],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Delivery',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cabin),
                label: 'Notes',
              ),
            ],
          ),
        ));
  }
}
