import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/store.dart';
import 'package:vinhomes_ecommerce/resources/dismiss_keyboard_widget.dart';
import 'package:vinhomes_ecommerce/views/cart_page/order_success.dart';

import '../../view_models/order_view_model.dart';
import '../../view_models/product_view_model.dart';
import 'component/cart_detail/order_details_list.dart';
import 'component/cart_detail/shipping_info.dart';

class CartDetail extends StatefulWidget {
  final Order order;
  final Store store;
  const CartDetail({super.key, required this.order, required this.store});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductViewModel>(context, listen: false).fetchProductList();
  }

  void onShippingInfoChange(String text) {
    setState(() {
      widget.order.address = text;
    });
  }

  void onButtonCheckoutClick() {
    try {
      print(jsonEncode(widget.order));
      widget.order.status = OrderStatus.HasCheckedOut.index + 1;
      OrderViewModel().updateOrder(widget.order);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (content) => OrderSuccessPage()));
    } catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error when add to cart"),
        duration: Duration(seconds: 5),
      ));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DismissKeyboard(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            onStretchTrigger: () {
              // Refresh the list, maybe
              return Future.value();
            },
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.store.name!),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
            automaticallyImplyLeading: true,
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              ShippingInfoWidget(onChange: onShippingInfoChange),
              Divider(thickness: 5),
              SizedBox(height: 10),
              OrderDetailList(orderDetailList: widget.order.orderDetails!),
              Divider(thickness: 5),
              //PaymentMethod(),
              GestureDetector(
                onTap: onButtonCheckoutClick,
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
                        'Thanh toán',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Abel',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.order.total!.toStringAsFixed(2),
                        style: TextStyle(
                          color: Color.fromRGBO(40, 184, 150, 1),
                          fontFamily: 'Abel',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ))
        ],
      )),
    ));
  }
}
