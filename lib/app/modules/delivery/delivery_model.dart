class Delivery {
  int? id;
  String? deliveredBy;
  String? recievedBy;
  int? changeFund;
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
    id = json['id'];
    deliveredBy = json['deliveredBy'];
    recievedBy = json['recievedBy'];
    changeFund = json['changeFund'];
    note = json['note'];
    createdAt = json['createdAt'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['deliveredBy'] = deliveredBy;
    data['recievedBy'] = recievedBy;
    data['changeFund'] = changeFund;
    data['note'] = note;
    data['createdAt'] = createdAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
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
  int? price;
  int? qtyRaw;
  int? qtyCook;
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
    price = json['price'];
    qtyRaw = json['qty_raw'];
    qtyCook = json['qty_cook'];
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
    deliveryId = json['delivery_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
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
