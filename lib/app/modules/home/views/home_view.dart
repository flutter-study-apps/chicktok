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

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
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
        // onPageChanged: (index) {
        //   // controller.onItemTapped(index);
        //   // controller.tabIndex.value = index;
        // },
      ),

      //  Center(
      //   child: GridView.count(
      //     primary: false,
      //     padding: const EdgeInsets.all(20),
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     crossAxisCount: 3,
      //     children: <Widget>[
      //       GestureDetector(
      //         onTap: () => Get.toNamed(Routes.PRODUCTS),
      //         child: Container(
      //           padding: const EdgeInsets.all(8),
      //           child: const Text("Inventory"),
      //           color: Colors.teal[100],
      //         ),
      //       ),
      //       Container(
      //         decoration: BoxDecoration(color: Colors.amber),
      //         padding: const EdgeInsets.all(8),
      //         child: const Text('POS'),
      //         // color: Colors.teal[200],
      //       ),
      //       GestureDetector(
      //         onTap: () => Get.toNamed(Routes.LOGIN),
      //         child: Container(
      //           decoration: BoxDecoration(color: Colors.cyan),
      //           padding: const EdgeInsets.all(8),
      //           child: const Text('Login'),
      //           // color: Colors.teal[200],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: controller.tabIndex.value,
      //   onTap: controller.onItemTapped,
      //   // onTap: (index) {
      //   //   // setState(() => _currentIndex = index);
      //   //   // _loadScreen();
      //   //   controller.onItemTapped;
      //   //   print(controller.tabIndex.value);
      //   // },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), title: Text('Settings')),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        fixedColor: Colors.blueGrey,
        unselectedItemColor: Colors.black,
        onTap: controller.onItemTapped,
        currentIndex: controller.tabIndex.value,
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
    );
  }

  // bottomNav(double width) {
  //   return Container(
  //       height: 60,
  //       width: width,
  //       padding: EdgeInsets.symmetric(horizontal: 8),
  //       decoration: BoxDecoration(
  //           // boxShadow: [boxShadow],
  //           borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(20),
  //             topLeft: Radius.circular(20),
  //           ),
  //           color: Colors.white),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // item(0, Icons.home, width),
  //           // item(1, Icons.search, width),
  //           // item(2, Icons.favorite_outline, width),
  //           // item(3, Icons.fiber_new, width)
  //         ],
  //       ));
  // }
}
