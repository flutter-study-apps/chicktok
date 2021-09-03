import 'dart:convert';

import 'package:chicktok/models/product.dart';
import 'package:chicktok/repository/repository.dart';

class ProductService {
  Repository _repository;

  ProductService() {
    _repository = Repository();
  }

  getProducts() async {
    try {
      var res = await _repository.httpGet(api: "products");
      return jsonDecode(res.body);
    } catch (e) {
      return [];
    }
  }
}
