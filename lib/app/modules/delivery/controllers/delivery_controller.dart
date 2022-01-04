import 'dart:async';

import 'package:chicktok/app/modules/delivery/providers/delivery_provider.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:get/get.dart';

import '../delivery_model.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController

  final count = 0.obs;
  var isStreamOn = true.obs;
  var isLoading = true.obs;
  var deliveriesStreamControllerController = StreamController<Delivery>().obs;
  var deliveries = <Delivery>[].obs;
  var newDeliveryProducts = <Product>[
    Product(id: 1, name: 'Roast Chicken', qtyRaw: 30, qtyCook: 4),
    Product(id: 2, name: 'Frietzkn 8', qtyRaw: 40, qtyCook: 8),
  ].obs;

  // List<Product> deliveredProductList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    deliveriesStreamControllerController.value.addStream(deliveryStream());
  }

  @override
  void dispose() {
    onClose();
    isStreamOn.value = false;
    deliveriesStreamControllerController.value.done;
    deliveriesStreamControllerController.value.close();
    super.dispose();
    // productStreamControllerController.close();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Stream<Delivery> deliveryStream() async* {
    // print('delivery stream running');
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 500));

      try {
        // print(newDeliveryProducts.value[0].name.toString());
        // print('delivery streaming');
        var response = await DeliveryProvider().getDeliveries();
        var body = response.body;

        List data = body["data"];

        List<Delivery> deliveriesData = [];

        for (var val in data) {
          deliveriesData.add(Delivery.fromJson(val));
        }

        deliveries.value = deliveriesData;

        isLoading.value = false;
      } catch (e) {
        isLoading.value = true;
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
