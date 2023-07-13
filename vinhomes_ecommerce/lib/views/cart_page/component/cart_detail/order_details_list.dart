import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/product.dart';
import 'package:vinhomes_ecommerce/view_models/product_view_model.dart';
import 'package:vinhomes_ecommerce/views/cart_page/component/cart_detail/order_details_item.dart';

class OrderDetailList extends StatefulWidget {
  final List<OrderDetail> orderDetailList;
  const OrderDetailList({super.key, required this.orderDetailList});

  @override
  State<OrderDetailList> createState() => _OrderDetailListState();
}

class _OrderDetailListState extends State<OrderDetailList> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductViewModel>(context, listen: false).fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    final productOnProvider = Provider.of<ProductViewModel>(context);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Tóm tắt đơn hàng",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        SizedBox(height: 15),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Product product = productOnProvider.productList.firstWhere(
                  (product) =>
                      product.id == widget.orderDetailList[index].productId);
              return OrderDetailsItem(
                orderDetail: widget.orderDetailList[index],
                product: product,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).primaryColor,
              );
            },
            itemCount: widget.orderDetailList.length)
      ]),
    );
  }
}
