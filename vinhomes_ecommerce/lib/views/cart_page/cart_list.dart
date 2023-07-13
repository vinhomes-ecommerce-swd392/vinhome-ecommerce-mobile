import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/view_models/order_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'package:vinhomes_ecommerce/views/cart_page/component/cart_list/cart_item.dart';

import '../../models/store.dart';
import 'cart_detail.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  void initState() {
    super.initState();

    Provider.of<OrderViewModel>(context, listen: false)
        .fetchOrderListByUser("some user id");
    Provider.of<StoreViewModel>(context, listen: false).fetchStoreList();
  }

  @override
  Widget build(BuildContext context) {
    final orderOnProvider = Provider.of<OrderViewModel>(context);
    final storeOnProvider = Provider.of<StoreViewModel>(context);

    var orderList = orderOnProvider.orderList
        .where((element) => element.status == OrderStatus.InCart.index + 1)
        .toList();
    return Scaffold(
      body: SafeArea(
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
              title: Text('Giỏ hàng của tôi'),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderList.length, // Replace with the actual item count
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (content) {
                      Store store = storeOnProvider.storeList.firstWhere(
                          (store) => store.id == orderList[index].storeId);

                      return CartDetail(order: orderList[index], store: store);
                    }));
                  },
                  child: ListTile(
                    title: CartItemWidget(
                      order: orderList[index],
                      storeList: storeOnProvider.storeList,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
