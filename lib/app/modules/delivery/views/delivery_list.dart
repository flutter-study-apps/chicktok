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

    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Chicktok Inventory System'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('date'),
                  ),
                  DataColumn(
                    label: Text('Products'),
                  ),
                  DataColumn(
                    label: Text('Delivered By'),
                  ),
                  DataColumn(
                    label: Text('Recieved By'),
                  ),
                  DataColumn(
                    label: Text('Change Fund'),
                  ),
                  DataColumn(
                    label: Text('Notes'),
                  ),
                ],
                rows: controller.deliveries.value
                    .map((e) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              // All rows will have the same selected color.
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.08);
                              }
                              // Even rows will have a grey color.
                              if (e.id!.isEven) {
                                return Colors.grey.withOpacity(0.3);
                              }
                              return null; // Use default value for other states and odd rows.
                            }),
                            cells: <DataCell>[
                              DataCell(
                                Text(DateFormat('MM/dd/yy').format(
                                  DateTime.parse(e.createdAt.toString()),
                                )),
                              ),

                              DataCell(RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: e.products
                                          ?.map(
                                            (v) => TextSpan(
                                              children: [
                                                TextSpan(
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    text: v.name),
                                                TextSpan(text: ' : '),
                                                TextSpan(
                                                    text: v.pivot!.quantity
                                                        .toString()),
                                                TextSpan(text: ';  '),
                                              ],
                                            ),
                                          )
                                          .toList()))),
                              // DataCell(Text(e.id.toString())),
                              DataCell(Text(e.deliveredBy.toString())),
                              DataCell(Text(e.recievedBy.toString())),
                              DataCell(Text(e.changeFund.toString())),
                              DataCell(Text(e.note.toString())),
                            ]))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}
