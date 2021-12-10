import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/widgets/widget_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  ProductsController productController = Get.put(ProductsController());

  // String dropdownValue = productController.products.value.products[0].name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.amber,
      child: Form(
        child: Column(
          children: [
            //Delivery Details
            Container(
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
                            child: ChkTkTextField('Date',
                                myHint: 'Enter the Date'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ChkTkTextField('Time',
                                myHint: 'Enter the Time'),
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
                                myHint:
                                    'Enter more details about the delivery'),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            //Product Details
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text("PRODUCT LIST".toUpperCase(),
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Fresh', textAlign: TextAlign.center),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Cook', textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 50,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(10),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            value: this
                                .productController
                                .products
                                .value
                                .products![0]
                                .name,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            // underline: Container(
                            //   height: 2,
                            //   color: Colors.deepPurpleAccent,
                            // ),
                            onChanged: (String? newValue) {},
                            // items: <String>['One', 'Two', 'Free', 'Four']
                            //     .map<DropdownMenuItem<String>>((String value) {
                            //   return DropdownMenuItem<String>(
                            //     value: value,
                            //     child: Text(value),
                            //   );
                            // }).toList(),
                            items: productController.products.value.products
                                ?.map((Product value) {
                              return DropdownMenuItem<String>(
                                  value: value.name,
                                  child: Text("${value.name}"));
                            }).toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
