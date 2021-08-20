import 'package:chicktok/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () => Get.toNamed(Routes.PRODUCTS),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Inventory"),
                color: Colors.teal[100],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              padding: const EdgeInsets.all(8),
              child: const Text('POS'),
              // color: Colors.teal[200],
            ),
          ],
        ),
      ),
    );
  }
}
