import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/view_models/order_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/user_view_model.dart';
import 'package:vinhomes_ecommerce/views/cart_page/component/cart_list/cart_item.dart';

import '../../models/store.dart';
import 'order_detail.dart';
import 'order_detail/order_details_list.dart';
import 'order_list/order_item.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
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
    final userOnProvider = Provider.of<UserViewModel>(context);
    print('User name: ${userOnProvider.user!.name}');

    var orderList = orderOnProvider.orderList
        .where((element) => element.status != OrderStatus.InCart.index + 1)
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
            child: orderOnProvider.orderList.isNotEmpty &&
                    storeOnProvider.storeList.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        orderList.length, // Replace with the actual item count
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
                                (store) =>
                                    store.id == orderList[index].storeId);

                            return OrderListDetail(
                                order: orderList[index], store: store);
                          }));
                        },
                        child: ListTile(
                          title: OrderItemWidget(
                            order: orderList[index],
                            storeList: storeOnProvider.storeList,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: double.infinity,
                    height: 500,
                    child: Center(child: CircularProgressIndicator()),
                  ),
          )
        ],
      )),
    );
  }
}
