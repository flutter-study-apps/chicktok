import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var userNameController = TextEditingController().obs;
  var passwordNameController = TextEditingController().obs;
  var isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    userNameController.value.text = "ialexies@gmail.com";
    passwordNameController.value.text = "123456";
    super.onInit();
  }

  @override
  signin(username, password) async {
    print(username);
    Map bodyData = {'email': username, 'password': password};
    var response = await http
        .post(Uri.parse("https://chicktok.com/api/auth/login"), body: bodyData);
    print(response);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
