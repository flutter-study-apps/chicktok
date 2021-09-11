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
    // ProductProvider().getProducts().then((value) {
    //   productStreamControllerController.value.addStream(productStream());
    //   change(value, status: RxStatus.success());
    // }, onError: (err) {
    //   print(err);
    // });

    // change(value, status: RxStatus.success());
  }

  Stream<Products> productStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 500));

      try {
        var response = await ProductProvider().getProducts();
        Map<String, dynamic> body = response;
        Products currentProduct = Products.fromJson(body);
        products.value = currentProduct;
        isLoading.value = false;
      } catch (e) {
        isLoading.value = true;
      }

      // ProductProvider().getProducts().then((response) {
      //   Map<String, dynamic> body = response;
      //   Products currentProduct = Products.fromJson(body);
      //   products.value = currentProduct;
      //   isLoading.value = false;
      // }).catchError((err) {
      //   isLoading.value = true;
      // });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {}
}
