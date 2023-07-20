import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinhomes_ecommerce/models/user.dart';
import 'package:vinhomes_ecommerce/resources/utils/firebase_utils.dart';

import '../../../models/order.dart';
import '../../../models/product.dart';
import '../../../view_models/order_view_model.dart';
import '../../../view_models/product_view_model.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;
  final int quantity;
  final String note;
  final Order? storeCurrentCart;
  const AddToCartButton(
      {super.key,
      required this.product,
      required this.quantity,
      required this.note,
      required this.storeCurrentCart});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  Future<void> onButtonClick() async {
    User customer;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? customerJson = prefs.getString("userInfo");
    customer = User.fromJson(jsonDecode(customerJson!));
    ;

    Order? currentCart = widget.storeCurrentCart;

    bool hasExistedItem = false;
    OrderDetail? existedItem;
    if (currentCart != null && currentCart.orderDetails != null) {
      existedItem = currentCart.orderDetails!.toList().firstWhereOrNull(
          (element) =>
              element.productId == widget.product.id &&
              element.note == widget.note);

      hasExistedItem = existedItem != null;
    }
    try {
      if (currentCart != null && hasExistedItem) {
        existedItem!.quantity = widget.quantity;

        // then update
        currentCart.total = currentCart.orderDetails!.fold(
            0, (total, element) => total! + element.price * element.quantity);
        OrderViewModel().updateOrder(currentCart);
      }

      OrderDetail newItem = OrderDetail(
          note: widget.note,
          quantity: widget.quantity,
          price: widget.product.price,
          productName: widget.product.name,
          productId: widget.product.id!);

      if (widget.storeCurrentCart != null && !hasExistedItem) {
        if (currentCart != null && currentCart.orderDetails != null) {
          currentCart.orderDetails!.add(newItem);
        } else {
          currentCart!.orderDetails = List.empty(growable: true);
          currentCart.orderDetails!.add(newItem);
        }

        currentCart.total = currentCart.orderDetails!.fold(
            0, (total, element) => total! + element.price * element.quantity);

        // then update
        OrderViewModel().updateOrder(currentCart);
      }
      String? fcmToken = await FirebaseApi().getFCMToken();

      if (widget.storeCurrentCart == null) {
        currentCart = Order(
            orderDate: DateTime.now(),
            total: 0,
            status: OrderStatus.InCart.index + 1,
            customerId: customer.id!,
            storeId: widget.product.storeId!,
            fcmToken: fcmToken,
            orderDetails: List.empty(growable: true));
        currentCart.orderDetails!.add(newItem);
        currentCart.total = currentCart.orderDetails!.fold(
            0, (total, element) => total! + element.price * element.quantity);
        OrderViewModel().addNewOrder(currentCart);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add to cart success"),
        duration: Duration(seconds: 5),
      ));
    } catch (exception) {
      log(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error when add to cart"),
        duration: Duration(seconds: 5),
      ));
    } finally {
      Navigator.of(context).pop("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Color.fromRGBO(41, 45, 50, 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.shopping_cart, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Thêm vào giỏ hàng',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Abel',
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '\$' +
                  (widget.product!.price * widget.quantity!).toStringAsFixed(2),
              style: TextStyle(
                color: Color.fromRGBO(40, 184, 150, 1),
                fontFamily: 'Abel',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
