import 'dart:async';
import 'dart:convert';

import 'package:chicktok/app/data/models/auth_response_model.dart';
import 'package:chicktok/app/modules/middleware/first_middleware.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var userNameController = TextEditingController().obs;
  var passwordNameController = TextEditingController().obs;
  var isLoading = false.obs;

  var connectivity = Connectivity().obs;
  var isConnected = false.obs;
  var connectivityType = "".obs;

  var isStreamConnectivityOn = true.obs;
  var connectivityController = StreamController().obs;

  bool get getIsConnected {
    return isConnected.value;
  }

  @override
  void onInit() {
    userNameController.value.text = "ialexies@gmail.com";
    passwordNameController.value.text = "1234567";
    initConnectivity();
    connectivityController.value.addStream(connectivityStream());
    super.onInit();
  }

  @override
  signin(username, password) async {
    initConnectivity();
    print(connectivityType);
    FirstMiddleware().isAuthenticated = true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected.value = true;
      connectivityType.value = "Data";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connectivityType.value = "Wifi";
      isConnected.value = true;
    } else {
      isConnected.value = false;
      connectivityType.value = "None";
    }
  }

  Stream connectivityStream() async* {
    while (isStreamConnectivityOn.value = true) {
      await Future.delayed(Duration(milliseconds: 1000));

      await initConnectivity();
    }
  }
}
