import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhomes_ecommerce/models/order.dart';

import '../data_resources/order/order_api_service.dart';
import '../models/user.dart';

class OrderViewModel with ChangeNotifier {
  List<Order> orderList = [];
  Order? order;

  fetchOrderList() async {
    this.orderList = await OrderApiServices().fetchOrderList();
    notifyListeners();
  }

  fetchOrderListByUser(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("userInfo");
    print(userJson!);
    User customer = User.fromJson(jsonDecode(userJson!));
    this.orderList =
        await OrderApiServices().fetchOrderListByUser(customer.id!);
    notifyListeners();
  }

  fetchOrder(String id) async {
    if (order != null && order!.id != id) order = null;
    this.order = await OrderApiServices().fetchOrder(id);
    notifyListeners();
  }

  addNewOrder(Order order) async {
    await OrderApiServices().postOrder(order);
  }

  updateOrder(Order order) async {
    await OrderApiServices().putOrder(order);
  }
}
