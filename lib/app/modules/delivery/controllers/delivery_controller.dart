import 'dart:async';
import 'dart:math';

import 'package:chicktok/app/data/models/new_delivery_product_model.dart';
import 'package:chicktok/app/modules/delivery/providers/delivery_provider.dart';
import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/delivery_model.dart';

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
  var rnd = new Random();
  ProductsController productController = Get.put(ProductsController());
  var newDeliveriescontrollers = <TextEditingController>[].obs;
  Rx<DeliveryDetails> newDelivery = DeliveryDetails(
      deliveredBy: "Alexies",
      recievedby: "Arnold",
      deliveryDate: "",
      deliveryTime: "",
      changeFund: 2600.0,
      deliveryNote: "A Sample Delivery Note",
      deliveryProducts: []).obs;

  Stream<Delivery> deliveryStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 2000));

      try {
        var response = await DeliveryProvider().getDeliveries();
        var body = response.body;

        List data = body["data"];

        // print(body["data"][0]['products'][0]['pivot']['quantity']);
        List<Delivery> deliveriesData = [];

        for (var val in data) {
          deliveriesData.add(Delivery.fromJson(val));
        }

        deliveries.value = deliveriesData;

        isLoading.value = false;
      } catch (e) {
        // isLoading.value = true;
      }
    }
  }

  void deleteDeliveryProduct(int index) {
    print('val for del $index');
    newDelivery.value.deliveryProducts!.removeAt(index);
    newDeliveriescontrollers.removeAt(index);
    update();
  }

  updateNewDeliveryProduct({
    required index,
    productVal,
    qtyRqw,
  }) {
    if (productVal != null) {
      newDelivery.value.deliveryProducts![index].product = productVal;
      print('product val- $productVal');
    }
    if (qtyRqw == null || qtyRqw.toString().trim() == "") {
      newDeliveriescontrollers.value[index].text = 0.toString();
      newDeliveriescontrollers.value[index].selection =
          TextSelection.fromPosition(TextPosition(
              offset: newDeliveriescontrollers.value[index].text.length));
    } else {
      // print(qtyRqw);

      newDeliveriescontrollers.value[index].text =
          int.parse(qtyRqw.toString()).toString();
      newDeliveriescontrollers.value[index].selection =
          TextSelection.fromPosition(TextPosition(
              offset: newDeliveriescontrollers.value[index].text.length));
      // print('fdf${newDeliveriescontrollers.value[index].text}');
      update();
    }
  }

  void addNewDeliveryItemRow(NewDeliveryProduct val) {
    final controller = TextEditingController();

    controller.text = val.raw.toString();
    val.productController = controller;
    newDelivery.value.deliveryProducts?.add(val);

    newDeliveriescontrollers.add(controller);
  }

  @override
  void onInit() async {
    super.onInit();
    deliveriesStreamControllerController.value.addStream(deliveryStream());
    newDelivery.value.deliveryDate = dateFormatter.format(now).toString();
    newDelivery.value.deliveryDate = timeFormatter.format(now).toString();

    //test data
    var controller = TextEditingController();
    addNewDeliveryItemRow(
      NewDeliveryProduct(
        Product(
          id: 1,
          description: 'Roasted chicken and marinated using secret ingredients',
          name: 'Roast Chicken',
          price: 22511,
        ),
        rnd.nextInt(90) + 10,
        productController: controller,
      ),
    );

    addNewDeliveryItemRow(
      NewDeliveryProduct(
        Product(
          id: 2,
          description: '<p>Short Description of the product</p>',
          name: 'Fried Chicken',
          price: 35,
        ),
        rnd.nextInt(90) + 10,
        productController: controller,
      ),
    );
    addNewDeliveryItemRow(
      NewDeliveryProduct(
        Product(
          id: 3,
          description: 'Short Description of the product',
          name: 'Fried Neck',
          price: 15,
        ),
        rnd.nextInt(90) + 10,
        productController: controller,
      ),
    );
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
