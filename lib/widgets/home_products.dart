import 'package:flutter/material.dart';
import 'package:chicktok/models/product.dart';
import 'package:chicktok/widgets/home_product.dart';

class HomeProducts extends StatefulWidget {
  // const HomeProducts({ Key? key }) : super(key: key);

  final List<Product> productList;
  HomeProducts({this.productList});

  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.productList.length,
          itemBuilder: (context, index) {
            return HomeProduct(this.widget.productList[index]);
          }),
    );
  }
}
