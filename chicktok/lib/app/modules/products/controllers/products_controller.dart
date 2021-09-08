import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/modules/products/providers/product_provider.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin {
  //TODO: Implement ProductsController

  final count = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    ProductProvider().getProducts().then((value) {
      // change is provided by StateMixin
      change(value, status: RxStatus.success());
    }, onError: (err) {
      print(err);

      // ProductProvider().getProducts();

      // change(null, status: RxStatus.error(err.toString()));
    });
  }

  Stream<Products> productStream() async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: 500));

      try {
        // Products someProduct = await ProductProvider().getProducts();

        var response = await ProductProvider().getProducts();
        // Map<String, dynamic> mappedResponseBody = response;
        // return Products.fromJson(response.body);
        // Product someProduct =

        print('api good');
        // yield someProduct;
        yield response;
        // yield Products.fromJson(mappedResponseBody);
      } catch (e) {
        print('api error');
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
  void increment() => count.value++;
}
