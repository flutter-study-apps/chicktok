import 'dart:async';
// import 'package:dotenv/dotenv.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsController productController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
    
          color: Colors.amber,
          width: double.infinity,
          child: productController.isLoading.value == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Loading List of Products'),
                    // Text(controller.errorText.value),
                  ],
                )
              : GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: productController.products.value.products?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title:
                              "${productController.products.value.products![index].name.toString().toUpperCase()}",
                          content: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.defaultDialog(title: 'Delivery');
                                  },
                                  child: Text('Add Stock'))
                            ],
                          ),
                        );
                      },
                      child: Card(
                        elevation: 13,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: .5),
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                '${FlutterConfig.get("SERVER_ADDRESS")}/img/${productController.products.value.products![index].img.toString()}',
                                fit: BoxFit.cover,
                              ),

                              Container(
                                color: Colors.black.withOpacity(.6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              productController.products.value
                                                  .products![index].name
                                                  .toString(),
                                              style: InventoryCardsText()
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                              // textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "P${productController.products.value.products![index].price.toString()}",
                                        style: InventoryCardsText().copyWith(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            // 'STOCKS: ${productController.products.value.products![index].qtyRaw}',
                                            'STOCKS: ${productController.products.value.products![index].qtyRaw! + productController.products.value.products![index].qtyCook!}',
                                            style:
                                                InventoryCardsText().copyWith(),
                                          ),
                                          Text(
                                            'Fresh: ${productController.products.value.products![index].qtyRaw!}   |   Cooked: ${productController.products.value.products![index].qtyCook!}',
                                            style: InventoryCardsText()
                                                .copyWith(fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sales: 35',
                                            style:
                                                InventoryCardsText().copyWith(),
                                          ),
                                        ],
                                      )
                                      // Text(data.products[index].description.toString()),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
    );
  }

  TextStyle InventoryCardsText() {
    return TextStyle(fontSize: 12, color: Colors.white70);
  }
}
