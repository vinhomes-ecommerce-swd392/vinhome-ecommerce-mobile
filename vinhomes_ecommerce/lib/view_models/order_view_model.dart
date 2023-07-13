import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/order.dart';

import '../data_resources/order/order_api_service.dart';

class OrderViewModel with ChangeNotifier {
  List<Order> orderList = [];
  Order? order;

  fetchOrderList() async {
    this.orderList = await OrderApiServices().fetchOrderList();
    notifyListeners();
  }

  fetchOrderListByUser(String userId) async {
    this.orderList = await OrderApiServices()
        .fetchOrderListByUser("1e3c96c9-1471-23e0-8765-390639088226");
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
