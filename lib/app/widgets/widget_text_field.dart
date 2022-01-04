import 'package:chicktok/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'widget_styles.dart';

class ChkTkTextField extends StatelessWidget {
  String myLabel;
  String myHint;
  Color mybgColor;
  DeliveryController deliveryController = Get.put(DeliveryController());
  dynamic txtVal;
  var txtControllerVal;

  // String newMethod(value) {
  //   print('$value');
  //   return "fdfd";
  //   // deliveryController.newDeliveryProducts.value[0].name ;
  // }

  ChkTkTextField(
      {this.myLabel = "",
      this.myHint = "Enter Value",
      this.mybgColor = Colors.white,
      this.txtControllerVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (val) {
          // print(val);
          // print(txtControllerVal);
          txtControllerVal = "fdfdfd";
        },
        decoration: WidgetStyles().ChktkTextFieldDecoration(
          myLabel: myLabel,
          myHint: myHint,
          mybgColor: mybgColor,
        ),
      ),
    );
  }
}
