import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../data_resources/product/product_api_service.dart';

class ProductListViewModel with ChangeNotifier {
  List<Product> productList = [];

  fetchProductList() async {
    this.productList = await ProductApiServices().fetchProductList();
    notifyListeners();
  }
}
