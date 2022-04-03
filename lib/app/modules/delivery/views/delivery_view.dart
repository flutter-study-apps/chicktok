import 'dart:math';

import 'package:chicktok/app/data/models/new_delivery_product_model.dart';
import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/widgets/widget_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';
import 'package:intl/intl.dart';

class DeliveryView extends GetView<DeliveryController> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  ProductsController productController = Get.put(ProductsController());
  var rnd = new Random();
  var _collapsed = false;
  // String dropdownValue = productController.products.value.products[0].name;
  @override
  Widget build(BuildContext context) {
    final df = new DateFormat('dd-MM-yyyy');

    // controller.newDeliveryProducts
    //    .add(NewProduct(productController.products.value.products![0], 40, 0));

    return Container(
        // padding: EdgeInsets.all(30),
        // padding: EdgeInsets.all(30),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        color: Colors.amber,
        child: Form(
          child: Obx(
            () => CustomScrollView(
              slivers: [
                //Delivery Details
                SliverToBoxAdapter(
                  child: Container(
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
                                    print(controller
                                        .deliveries.value[0].products);
                                    Get.toNamed('/delivery/list');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ChkTkTextField(
                                    initialVal: controller.deliveredBy.value,
                                    height: 50,
                                    myLabel: 'Delivered By',
                                    myHint: "Person who delivered",
                                    mybgColor: Colors.amber[400]!,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ChkTkTextField(
                                    initialVal: controller.recievedBy.value,
                                    height: 50,
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
                                    initialVal: controller.deliveryDate.value,
                                    height: 50,
                                    myLabel: 'Date',
                                    myHint: 'Enter the Date',
                                    mybgColor: Colors.amber[400]!,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ChkTkTextField(
                                    initialVal: controller.deliveryTime.value,
                                    height: 50,
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
                                    initialVal:
                                        controller.changeFund.value.toString(),
                                    myLabel: 'Change Fund',
                                    height: 50,
                                    myHint: 'Enter Change Fund Amount',
                                    mybgColor: Colors.amber[400]!,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ChkTkTextField(
                                    initialVal: controller.note.value,
                                    height: 50,
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
                ),

                // SizedBox(height: 30),
                SliverToBoxAdapter(
                  child: Divider(
                    thickness: 1,
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(

                                      // padding: EdgeInsets.symmetric(vertical: 10),
                                      child: FloatingActionButton(
                                    mini: true,
                                    onPressed: () =>
                                        controller.addNewDeliveryItemRow(
                                      NewDeliveryProduct(
                                        productController
                                            .products.value.products![0],
                                        // Product(
                                        //   id: 1,
                                        //   description:
                                        //       'Roasted chicken and marinated using secret ingredients',
                                        //   name: 'Roast Chicken',
                                        //   price: 22511,
                                        // ),
                                        // 0
                                        // rnd.nextInt(90) + 10,
                                      ),
                                    ),
                                    child: Icon(Icons.add),
                                  )),
                                  Text("  PRODUCT LIST".toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('Fresh', textAlign: TextAlign.center),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        controller.newDelivery.value.deliveryProducts!.isEmpty
                            ? SizedBox()
                            : Column(
                                children: controller
                                    .newDelivery.value.deliveryProducts!
                                    .map((e) {
                                  //  final item = controller.newDelivery.value.deliveryProducts.indexOf(e);
                                  int index = controller
                                      .newDelivery.value.deliveryProducts!
                                      .indexOf(e);
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                            onPressed: () => controller
                                                .deleteDeliveryProduct(
                                                    controller.newDelivery.value
                                                        .deliveryProducts!
                                                        .indexOf(e)),
                                            icon: Icon(Icons.delete),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            height: 50,
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<Product>(
                                                  isExpanded: true,
                                                  value: productController
                                                      .products.value.products!
                                                      .where((element) =>
                                                          element.id ==
                                                          e.product.id)
                                                      .first,
                                                  icon: const Icon(
                                                      Icons.arrow_downward),
                                                  elevation: 16,
                                                  style: const TextStyle(
                                                      color: Colors.deepPurple),
                                                  onChanged: (val) async {
                                                    if (val != null) {
                                                      controller
                                                          .updateNewDeliveryProduct(
                                                        index: controller
                                                            .newDelivery
                                                            .value
                                                            .deliveryProducts!
                                                            .indexOf(e),
                                                        productVal: val,
                                                      );
                                                    }
                                                  },
                                                  items: productController
                                                      .products.value.products
                                                      ?.map((Product
                                                          thisProduct) {
                                                    return DropdownMenuItem<
                                                            Product>(
                                                        value: thisProduct,
                                                        child: Text(
                                                            "${thisProduct.name}"));
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            height: 50,
                                            child: TextFormField(
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Qty';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                border: InputBorder.none,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // On
                                              textAlign: TextAlign.center,
                                              // controller: controller
                                              //         .newDeliveriescontrollers
                                              //         .value[
                                              //     controller.newDelivery.value
                                              //         .deliveryProducts!
                                              //         .indexOf(e)],
                                              controller: e.productController,
                                              onChanged: (_) => controller
                                                  .updateNewDeliveryProduct(
                                                      index: controller
                                                          .newDelivery
                                                          .value
                                                          .deliveryProducts!
                                                          .indexOf(e),
                                                      qtyRqw: _),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),

                        // Column(
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ElevatedButton.icon(
                      onPressed: () =>
                          controller.storeNewDelivery(DeliveryDetails),
                      icon: Icon(Icons.add),
                      label: Text('Add')),
                ),
              ],
            ),
          ),
        ));
  }
}
