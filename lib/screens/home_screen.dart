import 'package:chicktok/services/product_service.dart';
import 'package:chicktok/widgets/home_product.dart';
import 'package:chicktok/widgets/home_products.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:chicktok/models/product.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductService _productService = ProductService();
  List<Product> _productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllProducts();
  }

  void _getAllProducts() async {
    var products = await _productService.getProducts();
    var result = json.decode(products.body);

    result["data"].forEach((data) {
      var model = Product();
      model.id = data["id"];
      model.name = data["name"];
      model.description = data["description"];
      model.price = data["price"].toDouble();
      model.stock = data["stock"].toDouble();
      model.img = data["img"];

      setState(() {
        _productList.add(model);
      });
    });
    print(_productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chicktok'),
        actions: <Widget>[],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            HomeProducts(
              productList: _productList,
            )
          ],
        ),
      ),
    );
  }
}
