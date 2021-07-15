import 'package:chicktok/models/product.dart';
import 'package:flutter/material.dart';
import 'package:chicktok/repository/repository.dart';
import 'package:intl/intl.dart';

class HomeProduct extends StatefulWidget {
  // const HomeProduct({ Key? key }) : super(key: key);

  final Product product;
  var noSimbolInUSFormat =
      new NumberFormat.currency(locale: "en_US", symbol: "");

  Repository repository = Repository();

  HomeProduct(this.product);
  @override
  _HomeProductState createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  final formatCurrency = new NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5),
      height: 210,
      child: InkWell(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Text(this.widget.product.name.toString()),
                Text('${formatCurrency.format(this.widget.product.price)}'),
                Image.network(
                  // this.widget.product.img,
                  Repository().getBaseUrl() + "img/" + this.widget.product.img,
                  width: MediaQuery.of(context).size.width * .5,
                  height: 80,
                ),
                Text(this.widget.product.stock.toString()),
                Text(this.widget.product.description.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
