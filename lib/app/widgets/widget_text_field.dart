import 'package:chicktok/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'widget_styles.dart';

class ChkTkTextField extends StatelessWidget {
  String? myLabel;
  String? myHint;
  Color? mybgColor;
  dynamic initialVal;
  DeliveryController? deliveryController = Get.put(DeliveryController());
  dynamic? txtVal;
  TextEditingController? txtControllerVal;
  double? height;
  TextInputType? keyboardType;
  Function(String)? update;

  // String newMethod(value) {
  //   print('$value');
  //   return "fdfd";
  //   // deliveryController.newDeliveryProducts.value[0].name ;
  // }

  ChkTkTextField({
    this.myLabel = "",
    this.myHint = "Enter Value",
    this.mybgColor = Colors.white,
    this.txtControllerVal,
    this.initialVal,
    this.height,
    this.keyboardType,
    this.update,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: TextFormField(
        initialValue: initialVal,
        keyboardType: keyboardType,
        onChanged: update,
        decoration: WidgetStyles().ChktkTextFieldDecoration(
          myLabel: myLabel,
          myHint: myHint,
          mybgColor: mybgColor,
        ),
      ),
    );
  }
}
