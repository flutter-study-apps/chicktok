import 'dart:async';

import 'package:chicktok/app/data/models/new_delivery_product_model.dart';
import 'package:chicktok/app/modules/delivery/providers/delivery_provider.dart';
import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../delivery_model.dart';

class DeliveryController extends GetxController {
  //TODO: Implement DeliveryController
  var now = new DateTime.now();
  var dateFormatter = new DateFormat('MM-dd-yyyy');
  var timeFormatter = new DateFormat('hh:mm a');
  final count = 0.obs;
  var isStreamOn = true.obs;
  var isLoading = true.obs;
  RxString deliveredBy = "Alexies".obs;
  RxString recievedBy = "Arnold".obs;
  RxString deliveryDate = "".obs;
  RxString deliveryTime = "9 am".obs;
  RxString note = "Text Note".obs;
  RxDouble changeFund = 2600.0.obs;

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
    required index,
    productVal,
    qtyRqw,
  }) {
    if (productVal != null) {
      // var selected = newDeliveryProducts
      //     .where((p0) => p0.product.id == newDeliveryProductsItem.product.id)
      //     .first;
      newDeliveryProducts.value[index].product = productVal;
      // selected.product = productVal;

      // print(
      //     '---${newDeliveryProducts[newDeliveryProducts.indexOf(selected)].product.name.toString()}-- ${newDeliveryProducts.indexOf(selected)} ');
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
    deliveryDate.value = dateFormatter.format(now).toString();
    deliveryTime.value = timeFormatter.format(now).toString();

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
