import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../data_resources/product/product_api_service.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> productList = [];
  Product? product;

  fetchProductList() async {
    this.productList = await ProductApiServices().fetchProductList();
    notifyListeners();
  }

  fetchProduct(int id) async {
    if (product != null && product!.id != id) product = null;
    this.product = await ProductApiServices().fetchProduct(id);
    notifyListeners();
  }
}
