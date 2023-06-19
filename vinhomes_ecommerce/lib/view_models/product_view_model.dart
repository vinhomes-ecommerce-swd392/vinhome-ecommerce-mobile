import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../data_resources/product/product_api_service.dart';

class ProductViewModel with ChangeNotifier{

  Product? product;

  fetchProduct(int id) async {
    this.product = await ProductApiServices().fetchProduct(id);
    notifyListeners();
  }

}