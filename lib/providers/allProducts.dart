import 'package:flutter/material.dart';
import 'dart:math';

import '../models/product.dart';

class AllProducts with ChangeNotifier{
  List<Product> _allProducts =  List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );
  List<Product> get allProducts{
    return [..._allProducts];
  }

  Product findById(productId){
    return _allProducts.firstWhere((element) =>element.id== productId);
  }

  void addProduct(){
    // _allProducts.add(value);
    notifyListeners();
  }
}