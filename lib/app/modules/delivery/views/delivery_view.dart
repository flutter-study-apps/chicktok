import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DeliveryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
