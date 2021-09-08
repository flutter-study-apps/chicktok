import 'package:get/get.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);

    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Products.fromJson(map);
      if (map is List)
        return map.map((item) => Products.fromJson(item)).toList();
    };
    // httpClient.baseUrl = 'http://192.168.100.68/chicktok/public/api/';
  }

  Future<dynamic> getProducts() async {
    // final response = await get('products');
    final response =
        await get('http://192.168.100.68/chicktok/public/api/products');
    if (response.hasError) {
      print('error in getproducts  provider');
      print(response.statusCode);
      return Future.error(response.status);
    } else {
      print('good api in getproducts provider');

      return response.body;

      // Map<String, dynamic> body = response.body;
      // return Products.fromJson(response.body);
    }
  }

  Future<Products?> getProduct(int id) async {
    final response = await get('product/$id');
    return response.body;
  }

  Future<Response<Products>> postProduct(Products product) async =>
      await post('product', product);

  Future<Response> deleteProduct(int id) async => await delete('product/$id');
}
