import 'package:chicktok/app/data/models/new_delivery_product_model.dart';

class Delivery {
  int? id;
  String? deliveredBy;
  String? recievedBy;
  double? changeFund;
  String? note;

  String? createdAt;
  List<Products>? products;

  Delivery(
      {this.id,
      this.deliveredBy,
      this.recievedBy,
      this.changeFund,
      this.note,
      this.createdAt,
      this.products});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    deliveredBy = json['deliveredBy'].toString();
    recievedBy = json['recievedBy'].toString();
    changeFund = double.parse(json['changeFund'].toString());
    note = json['note'].toString();
    createdAt = json['createdAt'].toString();
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(DeliveryDetails deliveryData) {
    final data = <String, dynamic>{};
    // data['id'] = deliveryDataid;
    data['deliveredBy'] = deliveryData.deliveredBy;
    data['recievedBy'] = deliveryData.recievedby;
    data['changeFund'] = deliveryData.changeFund.toString();
    data['note'] = deliveryData.deliveryNote.toString();
    data['createdAt'] = createdAt.toString();
    if (deliveryData.deliveryProducts != null) {
      // data['products'] = products!.map((v) => v.toJson()).toList();
      data['products'] =
          deliveryData.deliveryProducts!.map((v) => v.toJson(v)).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  double? price;
  double? qtyRaw;
  double? qtyCook;
  String? img;
  Pivot? pivot;

  Products(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.price,
      this.qtyRaw,
      this.qtyCook,
      this.img,
      this.pivot});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    price = double.parse(json['price'].toString());
    qtyRaw = double.parse(json['qty_raw'].toString());
    qtyCook = double.parse(json['qty_cook'].toString());
    img = json['img'];
    pivot = json['pivot'] != null ? Pivot?.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['qty_raw'] = qtyRaw;
    data['qty_cook'] = qtyCook;
    data['img'] = img;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? deliveryId;
  int? productId;
  int? quantity;
  dynamic createdAt;

  Pivot({this.deliveryId, this.productId, this.quantity, this.createdAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    deliveryId = int.parse(json['delivery_id'].toString());
    productId = int.parse(json['product_id'].toString());
    quantity = int.parse(json['quantity'].toString());
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    return data;
  }
}
