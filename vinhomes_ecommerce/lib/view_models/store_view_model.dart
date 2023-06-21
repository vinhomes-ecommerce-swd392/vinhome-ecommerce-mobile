import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/store.dart';

import '../data_resources/product/product_api_service.dart';
import '../data_resources/store/store_api_service.dart';

class StoreViewModel with ChangeNotifier{

  Store? store;

  fetchStore(int id) async {
    this.store = await StoreApiServices().fetchStore(id);
    notifyListeners();
  }

  List<Store> StoreList = [];

  fetchStoreList() async {
    this.StoreList = await StoreApiServices().fetchStoreList();
    notifyListeners();
  }

}