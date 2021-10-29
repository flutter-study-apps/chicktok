import 'package:get/get.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_config/flutter_config.dart';
import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);

    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Products.fromJson(map);
      if (map is List) {
        return map.map((item) => Products.fromJson(item)).toList();
      }
    };
  }

  Future<dynamic> getProducts() async {
    // String api = '${dotenv.env['SERVER_ADDRESS']}/chicktok/public/api/products';
    String api = '${FlutterConfig.get("SERVER_ADDRESS")}/api/products';
    final response = await get(api);
    if (response.hasError) {
      return response;
    } else {
      print('good api in getproducts provider');
      return response.body;
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
