import 'dart:convert';

import 'package:chicktok/app/data/models/new_delivery_product_model.dart';
import 'package:get/get.dart';

import '../../../data/models/delivery_model.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

class DeliveryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 20);
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Delivery.fromJson(map);
      if (map is List)
        return map.map((item) => Delivery.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${FlutterConfig.get("SERVER_ADDRESS")}';
  }

  Future<dynamic> getDeliveries() async {
    String api = "${FlutterConfig.get("SERVER_ADDRESS")}/api/delivery/add";
    final response = await get(api);
    // print(response.body["data"]);
    if (response.hasError) {
      return response;
      // return print('fdf');
    } else {
      print('good api in getproducts provider');
      return response;
    }
  }

  Future storeDelivery(DeliveryDetails newDelivery) async {
    Map<String, dynamic> data = Delivery().toJson(newDelivery);

    String api = "${FlutterConfig.get("SERVER_ADDRESS")}/api/delivery/add";
    final response = await post(api, Delivery().toJson(newDelivery));
    // http.Response response = await http.post(
    //   Uri.parse(api),
    //   body: data,
    // );

    // final response = await http.post(
    //   Uri.parse(api),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: data,
    // );

    // print(response);
    return response;
    // final response = await get(api);
    // print(response.body["data"]);
    // if (response.hasError) {
    //   return response;
    //   // return print('fdf');
    // } else {
    //   // print('good api in getproducts provider');
    //   print('successfully added');
    //   // return response;
    // }
  }

  Future<Delivery?> getDelivery(int id) async {
    final response = await get('delivery/$id');
    return response.body;
  }

  Future<Response<Delivery>> postDelivery(Delivery delivery) async =>
      await post('delivery', delivery);
  Future<Response> deleteDelivery(int id) async => await delete('delivery/$id');
}
