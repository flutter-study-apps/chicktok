import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Product Inventory'),
        centerTitle: true,
      ),
      body: controller.obx((data) => Container(
                color: Colors.blueGrey[400],
                child: controller.status == RxStatus.error()
                    // ? CircularProgressIndicator()
                    ? Text(RxStatus.error().toString())
                    : StreamBuilder<Products>(
                        stream: controller.productStream(),
                        builder: (context, AsyncSnapshot<Products> snapshot) {
                          if (!snapshot.hasData) {
                            return Text('has no data');
                          } else {
                            // print(snapshot.toString());
                            // return Text('has data');

                            // print(snapshot.data);
                            return GridView.builder(
                                padding: EdgeInsets.all(20),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                ),
                                itemCount: data.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    elevation: 13,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: .5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Container(
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          // Positioned(
                                          //   child: Text('http://192.168.100.68/chicktok/public/img/'),
                                          // ),

                                          Image.network(
                                            'http://192.168.100.68/chicktok/public/img/${data.products[index].img.toString()}',
                                            // height: 30,
                                            fit: BoxFit.cover,
                                          ),

                                          Container(
                                            color: Colors.black.withOpacity(.6),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          data.products[index]
                                                              .name
                                                              .toString(),
                                                          style: InventoryCardsText()
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                          // textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "P${data.products[index].price.toString()}",
                                                    style: InventoryCardsText()
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.white,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'STOCKS: 35',
                                                        style:
                                                            InventoryCardsText()
                                                                .copyWith(),
                                                      ),
                                                      Text(
                                                        'Fresh: 35   |   Cooked: 4',
                                                        style:
                                                            InventoryCardsText()
                                                                .copyWith(
                                                                    fontSize:
                                                                        8),
                                                      )
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.white,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Sales: 35',
                                                        style:
                                                            InventoryCardsText()
                                                                .copyWith(),
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
                                    // subtitle: Text(data.products[index].description.to ,
                                    // title: Text(data.products[index].name.toString()),
                                    // subtitle: Text(data.products[index].description.toString()),
                                    // trailing: Text(data.products[index].price.toString()),
                                    // onTap: () => print(data.products[index].name.toString()),
                                  );
                                });
                          }
                        }),
                // : GridView.builder(
                //     padding: EdgeInsets.all(20),
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10,
                //       crossAxisCount: 2,
                //     ),
                //     itemCount: data.products.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Card(
                //         elevation: 13,
                //         shape: RoundedRectangleBorder(
                //             side:
                //                 BorderSide(color: Colors.white, width: .5),
                //             borderRadius: BorderRadius.circular(20)),
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         child: Container(
                //           child: Stack(
                //             fit: StackFit.expand,
                //             children: [
                //               // Positioned(
                //               //   child: Text('http://192.168.100.68/chicktok/public/img/'),
                //               // ),

                //               Image.network(
                //                 'http://192.168.100.68/chicktok/public/img/${data.products[index].img.toString()}',
                //                 // height: 30,
                //                 fit: BoxFit.cover,
                //               ),

                //               Container(
                //                 color: Colors.black.withOpacity(.6),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.center,
                //                     children: [
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           Flexible(
                //                             child: Text(
                //                               data.products[index].name
                //                                   .toString(),
                //                               style: InventoryCardsText()
                //                                   .copyWith(
                //                                       color: Colors.white,
                //                                       fontWeight:
                //                                           FontWeight.bold,
                //                                       fontSize: 14),
                //                               // textAlign: TextAlign.center,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       Text(
                //                         "P${data.products[index].price.toString()}",
                //                         style:
                //                             InventoryCardsText().copyWith(
                //                           fontWeight: FontWeight.w100,
                //                           fontSize: 20,
                //                         ),
                //                       ),
                //                       Divider(
                //                         color: Colors.white,
                //                       ),
                //                       Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           Text(
                //                             'STOCKS: 35',
                //                             style: InventoryCardsText()
                //                                 .copyWith(),
                //                           ),
                //                           Text(
                //                             'Fresh: 35   |   Cooked: 4',
                //                             style: InventoryCardsText()
                //                                 .copyWith(fontSize: 8),
                //                           )
                //                         ],
                //                       ),
                //                       Divider(
                //                         color: Colors.white,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           Text(
                //                             'Sales: 35',
                //                             style: InventoryCardsText()
                //                                 .copyWith(),
                //                           ),
                //                         ],
                //                       )
                //                       // Text(data.products[index].description.toString()),
                //                     ],
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         // subtitle: Text(data.products[index].description.to ,
                //         // title: Text(data.products[index].name.toString()),
                //         // subtitle: Text(data.products[index].description.toString()),
                //         // trailing: Text(data.products[index].price.toString()),
                //         // onTap: () => print(data.products[index].name.toString()),
                //       );
                //     }),
              )
          // (state) => null
          ),
    );
  }

  TextStyle InventoryCardsText() {
    return TextStyle(fontSize: 12, color: Colors.white70);
  }
}
