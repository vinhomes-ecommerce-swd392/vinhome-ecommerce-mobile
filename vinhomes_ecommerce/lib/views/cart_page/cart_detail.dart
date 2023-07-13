import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/store.dart';
import 'package:vinhomes_ecommerce/resources/dismiss_keyboard_widget.dart';
import 'package:vinhomes_ecommerce/views/cart_page/component/cart_detail/order_payment.dart';

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
              ShippingInfoWidget(),
              Divider(thickness: 5),
              SizedBox(height: 10),
              OrderDetailList(orderDetailList: widget.order.orderDetails!),
              Divider(thickness: 5),
              PaymentMethod(),
              Container(
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
                      'Thanh toan',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Abel',
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Total price',
                      style: TextStyle(
                        color: Color.fromRGBO(40, 184, 150, 1),
                        fontFamily: 'Abel',
                        fontSize: 16,
                      ),
                    ),
                  ],
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
