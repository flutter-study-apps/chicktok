import 'package:chicktok/models/product.dart';
import 'package:chicktok/repository/repository.dart';

class ProductService {
  Repository _repository;

  ProductService() {
    _repository = Repository();
  }

  getProducts() async {
    return await _repository.httpGet(api: "products");
  }
}
