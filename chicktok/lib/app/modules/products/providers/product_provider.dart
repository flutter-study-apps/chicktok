import 'package:get/get.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);
    httpClient.maxAuthRetries = 3;
    httpClient.addAuthenticator((request) async {
      final response = await get("http://192.168.100.68/chicktok/public/api");
      final token = response.body[
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvY2hpY2t0b2suY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjI5NDY0NTA2LCJleHAiOjE2Mjk0NjgxMDYsIm5iZiI6MTYyOTQ2NDUwNiwianRpIjoidDlLN25NMGlURFhzSjgweSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.N7Mw3DVEyv6jR8CT6ARIurdKIjBxF5Bw3srz4bMELas'];
      request.headers['Authorization'] = "$token";
      // return request;
    });
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Products.fromJson(map);
      if (map is List)
        return map.map((item) => Products.fromJson(item)).toList();
    };
    // httpClient.baseUrl = 'http://192.168.100.68/chicktok/public/api/';
  }

  Future<Products?> getProducts() async {
    // final response = await get('products');
    final response =
        await get('http://192.168.100.68/chicktok/public/api/products');
    if (response.hasError) {
      print(response.statusCode);
      return Future.error(response.status);
    } else {
      Map<String, dynamic> body = response.body;
      return Products.fromJson(response.body);
      // return  Product() response.body;
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
