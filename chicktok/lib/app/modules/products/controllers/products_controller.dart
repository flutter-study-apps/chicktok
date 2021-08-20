import 'package:chicktok/app/modules/products/providers/product_provider.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  //TODO: Implement ProductsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    ProductProvider().getProducts().then((value) {
      // change is provided by StateMixin
      change(value, status: RxStatus.success());
    }, onError: (err) {
      print(err);
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
