import 'dart:async';

import 'package:chicktok/app/modules/delivery/providers/delivery_provider.dart';
import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../delivery_model.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController

  final count = 0.obs;
  var isStreamOn = true.obs;
  var isLoading = true.obs;
  var deliveriesStreamControllerController = StreamController<Delivery>().obs;
  var deliveries = <Delivery>[].obs;
  ProductsController productController = Get.put(ProductsController());
  var newDeliveryProducts = <NewDeliveryProduct>[
    NewDeliveryProduct(
      Product(
        id: 1,
        description: 'Roasted chicken and marinated using secret ingredients',
        name: 'Roast Chicken',
        price: 22511,
        qtyRaw: 30,
      ),
      49,
    )
  ].obs;

  void updateNewDeliveryProduct({
    required NewDeliveryProduct newDeliveryProductsItem,
    productVal,
    qtyRqw,
  }) {
    if (productVal != null) {
      var selected = newDeliveryProducts
          .where((p0) => p0.product.id == newDeliveryProductsItem.product.id)
          .first;
      selected.product = productVal;

      print('---${newDeliveryProducts[0].product.name}');
    }
    if (qtyRqw != null) {}
  }

  void addNewDeliveryItemRow() {
    newDeliveryProducts.add(NewDeliveryProduct(
      Product(
        id: 1,
        description: 'Roasted chicken and marinated using secret ingredients',
        name: 'Roast Chicken',
        price: 22511,
        qtyRaw: 30,
      ),
      0,
    ));
  }

  @override
  void onInit() async {
    super.onInit();

    // initializeValNewProduct();
    // deliveriesStreamControllerController.value.addStream(deliveryStream());
  }

  @override
  void onBuild() async {
    super.onStart();
    // newDeliveryProducts.add(NewDeliveryProduct(
    //   productController.products.value.products![0],
    //   40,
    // ));
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

  // Stream<Delivery> deliveryStream() async* {
  //   // print('delivery stream running');
  //   while (isStreamOn.value == true) {
  //     await Future.delayed(Duration(milliseconds: 500));

  //     try {
  //       // print(newDeliveryProducts.value[0].name.toString());
  //       // print('delivery streaming');
  //       var response = await DeliveryProvider().getDeliveries();
  //       var body = response.body;++

  //       List data = body["data"];

  //       List<Delivery> deliveriesData = [];

  //       for (var val in data) {
  //         deliveriesData.add(Delivery.fromJson(val));
  //       }

  //       deliveries.value = deliveriesData;

  //       isLoading.value = false;
  //     } catch (e) {
  //       isLoading.value = true;
  //     }
  //   }
  // }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class NewDeliveryProduct {
  Product product;
  int raw;

  NewDeliveryProduct(
    this.product,
    this.raw,
  );
}
