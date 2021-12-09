import 'package:chicktok/app/widgets/widget_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      color: Colors.amber,
      child: Form(
        child: Column(
          children: [
            Row(
              children: [
                Text("Delivery Details".toUpperCase(),
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ChkTkTextField('Delivered By',
                          myHint: "Person who delivered"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: ChkTkTextField('Recieved By',
                          myHint: 'Person who recieved'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ChkTkTextField('Date', myHint: 'Enter the Date'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ChkTkTextField('Time', myHint: 'Enter the Time'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ChkTkTextField('Change Fund',
                          myHint: 'Enter Change Fund Amount'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ChkTkTextField('Note',
                          myHint: 'Enter more details about the delivery'),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ));
  }


}
