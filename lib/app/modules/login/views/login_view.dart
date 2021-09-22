import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import 'package:flutter/widgets.dart';
// import 'package:getconnect_auth_flow/statemanagement/providers/providers.dart';
import 'package:chicktok/app/data/providers/auth_response_provider.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fdf'),
      ),
      body: Obx(() => Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: controller.isLoading.value
              ? Text('Logged Out')
              : ListView(children: [
                  headerSection(),
                  textSection(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      margin: EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple)),
                          child: Text('Login'),
                          onPressed: () {
                            controller.signin(
                                controller.userNameController.value.text,
                                controller.passwordNameController.value.text);
                          })),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Connection Type: ${controller.connectivityType.value}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  )
                ]))),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text(
        "Login",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white70, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: controller.userNameController.value,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.white70),
                hintText: "Email",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintStyle: TextStyle(color: Colors.white70)),
          ),
          TextFormField(
            controller: controller.passwordNameController.value,
            obscureText: true,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.white70),
                hintText: "Password",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintStyle: TextStyle(color: Colors.white70)),
          )
        ],
      ),
    );
  }
}
