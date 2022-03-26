import 'dart:async';

import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/modules/products/providers/product_provider.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  //TODO: Implement ProductsController

  final count = 0.obs;
  var isLoading = true.obs;
  var isStreamOn = true.obs;
  var productStreamControllerController = StreamController<Products>().obs;
  var products = Products().obs;

  // final test = productStream().s
  @override
  void dispose() {
    onClose();
    isStreamOn.value = false;
    productStreamControllerController.value.done;
    productStreamControllerController.value.close();
    super.dispose();
    // productStreamControllerController.close();
  }

  @override
  void onInit() {
    super.onInit();
    productStreamControllerController.value.addStream(productStream());
  }

  Stream<Products> productStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 1000));

      try {
        // print('product streaming');
        var response = await ProductProvider().getProducts();
        Map<String, dynamic> body = response.body;
        Products currentProduct = Products.fromJson(body);
        products.value = currentProduct;
        isLoading.value = false;
      } catch (e) {
        isLoading.value = true;
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {}
}
