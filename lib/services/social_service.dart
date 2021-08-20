import 'package:chicktok/models/product.dart';
import 'package:chicktok/repository/repository.dart';

class SocialService {
  Repository _repository;

  SocialService() {
    _repository = Repository();
  }

  getSocials() async {
    return await _repository.httpGet2();
  }
}
