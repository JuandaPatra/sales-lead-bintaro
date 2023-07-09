import 'package:flutter/material.dart';
import 'package:flutter_sales_lead/providers/allProducts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    // ...
    final prodId = Provider.of<AllProducts>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Text("INI ADALAG PAGE PRODUK (${prodId.title})"),
      ),
    );
  }
}
