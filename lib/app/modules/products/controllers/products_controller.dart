import 'dart:async';

import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/modules/products/providers/product_provider.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  //TODO: Implement ProductsController

  final count = 0.obs;
  var isLoading = true.obs;
  var productStreamControllerController = StreamController<Products>().obs;
  var products = Products().obs;
  // final test = productStream().s
  @override
  void dispose() {
    super.dispose();
    productStreamControllerController.close();
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
    while (true) {
      await Future.delayed(Duration(milliseconds: 1000));

      try {
        // Products someProduct = await ProductProvider().getProducts();

        var response = await ProductProvider().getProducts();

        print('api good in stream');
        print(" Updated Data at ${DateTime.now()} from server");

        Map<String, dynamic> body = response;
        // print(body);
        // Products.fromJson(body);
        Products currentProduct = Products.fromJson(body);
        products.value = currentProduct;
        isLoading.value = false;

        // yield currentProduct;
      } catch (e) {
        print('api error stream');
        isLoading.value = true;
        // products.value = "";
        printError();
        // productStreamControllerController.
        // throw Exception();
        // throw Exception('Intentional exception');
        // return;
        // throw FormatException();
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
