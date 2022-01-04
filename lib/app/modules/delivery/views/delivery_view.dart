import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/widgets/widget_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';
import 'package:intl/intl.dart';

class DeliveryView extends GetView<DeliveryController> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  ProductsController productController = Get.put(ProductsController());
  var _collapsed = false;
  // String dropdownValue = productController.products.value.products[0].name;
  @override
  Widget build(BuildContext context) {
    final df = new DateFormat('dd-MM-yyyy');

    return Obx(() => Container(
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
                              style: Theme.of(context).textTheme.subtitle1),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: 50,
                              child: IconButton(
                                icon: Icon(Icons.table_chart),
                                color: Colors.white,
                                onPressed: () {
                                  print(
                                      controller.deliveries.value[0].products);
                                  Get.toNamed('/delivery/list');
                                },
                              ),
                            ),
                          )
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
                                child: ChkTkTextField(
                                  myLabel: 'Delivered By',
                                  myHint: "Person who delivered",
                                  mybgColor: Colors.amber[400]!,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: ChkTkTextField(
                                  myLabel: 'Recieved By',
                                  myHint: 'Person who recieved',
                                  mybgColor: Colors.amber[400]!,
                                ),
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
                                child: ChkTkTextField(
                                  myLabel: 'Date',
                                  myHint: 'Enter the Date',
                                  mybgColor: Colors.amber[400]!,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ChkTkTextField(
                                  myLabel: 'Time',
                                  myHint: 'Enter the Time',
                                  mybgColor: Colors.amber[400]!,
                                ),
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
                                child: ChkTkTextField(
                                  myLabel: 'Change Fund',
                                  myHint: 'Enter Change Fund Amount',
                                  mybgColor: Colors.amber[400]!,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ChkTkTextField(
                                  myLabel: 'Note',
                                  myHint:
                                      'Enter more details about the delivery',
                                  mybgColor: Colors.amber[400]!,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
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
                                style: Theme.of(context).textTheme.subtitle1),
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
                      // Row(
                      //   children: [
                      //     Text(controller.newDeliveryProducts.value.first.id
                      //         .toString()),
                      //   ],
                      // ),
                      SizedBox(height: 10),
                      Column(
                        children: controller.newDeliveryProducts.value
                            .map((e) => Text(e.name.toString()))
                            .toList(),
                      ),

                      Column(
                        children: controller.newDeliveryProducts.value
                            .map(
                              (e) => Row(
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
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        onChanged: (String? newValue) {},
                                        items: productController
                                            .products.value.products
                                            ?.map((Product value) {
                                          return DropdownMenuItem<String>(
                                              value: value.name,
                                              child: Text("${value.name}"));
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 50,
                                      child: ChkTkTextField(
                                        txtControllerVal: deliveryController
                                            .newDeliveryProducts.value[0].name,
                                        myHint: 'Qty',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 50,
                                      child: ChkTkTextField(
                                        myHint: 'Qty',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       flex: 5,
                      //       child: Container(
                      //         height: 50,
                      //         child: DropdownButtonFormField<String>(
                      //           decoration: InputDecoration(
                      //             border: OutlineInputBorder(),
                      //             contentPadding: EdgeInsets.all(10),
                      //             fillColor: Colors.white,
                      //             filled: true,
                      //           ),
                      //           value: this
                      //               .productController
                      //               .products
                      //               .value
                      //               .products![0]
                      //               .name,
                      //           icon: const Icon(Icons.arrow_downward),
                      //           elevation: 16,
                      //           style:
                      //                   const TextStyle(color: Colors.deepPurple),
                      //           onChanged: (String? newValue) {},
                      //           items: productController.products.value.products
                      //               ?.map((Product value) {
                      //             return DropdownMenuItem<String>(
                      //                 value: value.name,
                      //                 child: Text("${value.name}"));
                      //           }).toList(),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 5),
                      //     Expanded(
                      //       flex: 2,
                      //       child: Container(
                      //         height: 50,
                      //         child: ChkTkTextField(
                      //           myHint: 'Qty',
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 5),
                      //     Expanded(
                      //       flex: 2,
                      //       child: Container(
                      //         height: 50,
                      //         child: ChkTkTextField(
                      //           myHint: 'Qty',
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
