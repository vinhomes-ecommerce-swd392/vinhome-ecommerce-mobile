import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/store.dart';

import '../data_resources/store/store_api_service.dart';

class StoreViewModel with ChangeNotifier {
  Store? store;

  fetchStore(int id) async {
    if (store!= null && store!.id != id) store = null;
    this.store = await StoreApiServices().fetchStore(id);
    notifyListeners();
  }

  List<Store> storeList = [];

  fetchStoreList() async {
    this.storeList = await StoreApiServices().fetchStoreList();
    notifyListeners();
  }
}
