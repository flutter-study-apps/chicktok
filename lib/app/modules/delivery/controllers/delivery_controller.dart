import 'dart:async';
import 'dart:math';

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
  var rnd = new Random();
  ProductsController productController = Get.put(ProductsController());
  List<TextEditingController> newDeliveriescontrollers = [];
  Rx<DeliveryDetails> newDelivery = DeliveryDetails(
      deliveredBy: "Alexies",
      recievedby: "Arnold",
      deliveryDate: "",
      deliveryTime: "",
      changeFund: 2600.0,
      deliveryNote: "A Sample Delivery Note",
      deliveryProducts: []).obs;

  // var newDeliveryProducts = <NewDeliveryProduct>[
  //   NewDeliveryProduct(
  //     Product(
  //       id: 1,
  //       description: 'Roasted chicken and marinated using secret ingredients',
  //       name: 'Roast Chicken',
  //       price: 22511,
  //       qtyRaw: 30,
  //     ),
  //     49,
  //   )
  // ].obs;

  void deleteDeliveryProduct(int index) {
    print('val for del $index');
    // print(controller.newDelivery.value.deliveryProducts.indexOf(e));

    // int index = controller.newDelivery.value.deliveryProducts.indexOf(e);
    newDelivery.value.deliveryProducts!.removeAt(index);
    // print();
    update();
  }

  updateNewDeliveryProduct({
    required index,
    productVal,
    qtyRqw,
  }) {
    if (productVal != null) {
      // var selected = newDeliveryProducts
      //     .where((p0) => p0.product.id == newDeliveryProductsItem.product.id)
      //     .first;
      newDelivery.value.deliveryProducts![index].product = productVal;
      // selected.product = productVal;

      // print(
      //     '---${newDeliveryProducts[newDeliveryProducts.indexOf(selected)].product.name.toString()}-- ${newDeliveryProducts.indexOf(selected)} ');
    }
    if (qtyRqw == null || qtyRqw.toString().trim() == "") {
    } else {
      print(qtyRqw);
      newDelivery.value.deliveryProducts![index].raw =
          int.parse(qtyRqw.toString());
      print(newDelivery.value.deliveryProducts![index].raw);
      print('fdf');
      update();
    }
  }

  void addNewDeliveryItemRow({val}) {
    newDelivery.value.deliveryProducts?.add(val);

// Add the dynamic cntroller here for hte added product
  }

  @override
  void onInit() async {
    super.onInit();
    newDelivery.value.deliveryDate = dateFormatter.format(now).toString();
    newDelivery.value.deliveryDate = timeFormatter.format(now).toString();

    addNewDeliveryItemRow(
      val: NewDeliveryProduct(
        Product(
          id: 1,
          description: 'Roasted chicken and marinated using secret ingredients',
          name: 'Roast Chicken',
          price: 22511,
        ),
        rnd.nextInt(90) + 10,
      ),
    );

    addNewDeliveryItemRow(
      val: NewDeliveryProduct(
        Product(
          id: 2,
          description: 'Short Description of the product',
          name: 'Frietzkn 8',
          price: 35,
        ),
        rnd.nextInt(90) + 10,
      ),
    );
    addNewDeliveryItemRow(
      val: NewDeliveryProduct(
        Product(
          id: 1,
          description: 'Roasted chicken and marinated using secret ingredients',
          name: 'Roast Chicken',
          price: 22511,
        ),
        rnd.nextInt(90) + 10,
      ),
    );
    // newDelivery.value.deliveryProducts?.add(
    //   NewDeliveryProduct(
    //     Product(
    //       id: 1,
    //       description: 'Roasted chicken and marinated using secret ingredients',
    //       name: 'Roast Chicken',
    //       price: 22511,
    //     ),
    //     rnd.nextInt(90) + 10,
    //   ),
    // );
    // newDelivery.value.deliveryProducts?.add(
    //   NewDeliveryProduct(
    //     Product(
    //       id: 2,
    //       description: 'Short Description of the product',
    //       name: 'Frietzkn 8',
    //       price: 35,
    //     ),
    //     rnd.nextInt(90) + 10,
    //   ),
    // );
    // newDelivery.value.deliveryProducts?.add(
    //   NewDeliveryProduct(
    //     Product(
    //       id: 1,
    //       description: 'Roasted chicken and marinated using secret ingredients',
    //       name: 'Roast Chicken',
    //       price: 22511,
    //     ),
    //     rnd.nextInt(90) + 10,
    //   ),
    // );
    // newDeliveryDetails.deliveryDate.value =
    //     dateFormatter.format(now).toString();
    // deliveryTime.value = timeFormatter.format(now).toString();

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
