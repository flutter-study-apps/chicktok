import 'package:chicktok/app/modules/products/product_model.dart';
import 'package:flutter/cupertino.dart';

class NewDeliveryProduct {
  Product product;
  int raw;

  NewDeliveryProduct(
    this.product,
    this.raw,
  );
}

class DeliveryDetails {
  String deliveredBy;
  String recievedby;
  String deliveryDate;
  String deliveryTime;
  double changeFund;
  String? deliveryNote;
  List<NewDeliveryProduct>? deliveryProducts;
  DeliveryDetails(
      {required this.deliveredBy,
      required this.recievedby,
      required this.deliveryDate,
      required this.deliveryTime,
      required this.changeFund,
      this.deliveryNote,
      this.deliveryProducts});
}
