import 'package:chicktok/app/modules/delivery/views/delivery_view.dart';
import 'package:chicktok/app/modules/login/views/login_view.dart';
import 'package:chicktok/app/modules/products/views/products_view.dart';
import 'package:chicktok/app/modules/report/views/report_view.dart';
import 'package:chicktok/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Obx(() => Scaffold(
       resizeToAvoidBottomInset: false, 
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Chicktok Inventory System'),
            centerTitle: true,
          ),
          body: PageView(
            children: [
              ProductsView(),
              DeliveryView(),
              ReportView(),
              SettingView(),
            ],
            controller: controller.pageController.value,
            // physics: NeverScrollableScrollPhysics(),

            onPageChanged: controller.onPageChanged(controller.tabIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            onTap: controller.onItemTapped,
            currentIndex: controller.tabIndex.value,
            selectedItemColor: Colors.amber[800],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.storefront),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping),
                label: 'Delivery',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_outlined),
                label: 'Sales Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setgings',
              ),
            ],
          ),
        ));
  }
}
