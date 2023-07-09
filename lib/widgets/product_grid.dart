import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/product.dart';
import '../widgets/product_item.dart';
import '../providers/allProducts.dart';
class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   final productData= Provider.of<AllProducts>(context);

   final all_product =productData.allProducts;
    return GridView.builder(
      
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (ctx, i) => ProductItem(
        all_product[i].id!,
        all_product[i].title!,
        all_product[i].imageUrl!,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
