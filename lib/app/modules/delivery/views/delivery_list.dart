import 'package:chicktok/app/modules/products/controllers/products_controller.dart';
import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:chicktok/app/widgets/widget_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';
import 'package:intl/intl.dart';
import 'package:collapsible/collapsible.dart';

class DeliveryListView extends GetView<DeliveryController> {
  DeliveryController deliveryController = Get.put(DeliveryController());
  ProductsController productController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    final df = new DateFormat('dd-MM-yyyy');

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Chicktok Inventory System'),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: controller.deliveries.length,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var delivery = controller.deliveries[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Date: ${delivery.createdAt}'),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivered by:'),
                              Text(' ${delivery.deliveredBy}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Recieved by:'),
                              Text('${delivery.recievedBy}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Change Fund:'),
                              Text('P ${delivery.changeFund}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Notes '),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      '\"${delivery.note}\"',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.amber.withOpacity(.3),
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: delivery.products?.length ?? 0,
                              itemBuilder: (context, index) {
                                var product = delivery.products![index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${index + 1}.) ${product.name}'),
                                    Text('${product.qtyRaw}')
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })

            // DataTable(
            //   columns: const <DataColumn>[
            //     DataColumn(
            //       label: Text('date'),
            //     ),
            //     DataColumn(
            //       label: Text('Products'),
            //     ),
            //     DataColumn(
            //       label: Text('Delivered By'),
            //     ),
            //     DataColumn(
            //       label: Text('Recieved By'),
            //     ),
            //     DataColumn(
            //       label: Text('Change Fund'),
            //     ),
            //     DataColumn(
            //       label: Text('Notes'),
            //     ),
            //   ],
            //   rows: controller.deliveries.value
            //       .map((e) => DataRow(
            //               color: MaterialStateProperty.resolveWith<Color?>(
            //                   (Set<MaterialState> states) {
            //                 // All rows will have the same selected color.
            //                 if (states.contains(MaterialState.selected)) {
            //                   return Theme.of(context)
            //                       .colorScheme
            //                       .primary
            //                       .withOpacity(0.08);
            //                 }
            //                 // Even rows will have a grey color.
            //                 if (e.id!.isEven) {
            //                   return Colors.grey.withOpacity(0.3);
            //                 }
            //                 return null; // Use default value for other states and odd rows.
            //               }),
            //               cells: <DataCell>[
            //                 DataCell(
            //                   Text(DateFormat('MM/dd/yy').format(
            //                     DateTime.parse(e.createdAt.toString()),
            //                   )),
            //                 ),

            //                 DataCell(RichText(
            //                     text: TextSpan(
            //                         style: TextStyle(color: Colors.black),
            //                         children: e.products
            //                             ?.map(
            //                               (v) => TextSpan(
            //                                 children: [
            //                                   TextSpan(
            //                                       style: TextStyle(
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                       text: v.name),
            //                                   TextSpan(text: ' : '),
            //                                   TextSpan(
            //                                       text: v.pivot!.quantity
            //                                           .toString()),
            //                                   TextSpan(text: ';  '),
            //                                 ],
            //                               ),
            //                             )
            //                             .toList()))),
            //                 // DataCell(Text(e.id.toString())),
            //                 DataCell(Text(e.deliveredBy.toString())),
            //                 DataCell(Text(e.recievedBy.toString())),
            //                 DataCell(Text(e.changeFund.toString())),
            //                 DataCell(Text(e.note.toString())),
            //               ]))
            //       .toList(),
            // ),
            ),
      ),
    );
  }
}
