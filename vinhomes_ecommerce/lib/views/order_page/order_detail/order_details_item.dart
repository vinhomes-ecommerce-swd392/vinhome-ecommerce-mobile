import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../../shop_details/shop_item_details.dart';

class OrderDetailsItem extends StatefulWidget {
  final OrderDetail orderDetail;
  final Product product;
  const OrderDetailsItem(
      {super.key, required this.orderDetail, required this.product});

  @override
  State<OrderDetailsItem> createState() => _OrderDetailsItemState();
}

class _OrderDetailsItemState extends State<OrderDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('${widget.orderDetail.quantity}x',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              const SizedBox(width: 3), //Seperator
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('${widget.product.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Text('\$${widget.orderDetail.price.toStringAsFixed(2)}')
                    ],
                  ),
                  Text(widget.orderDetail.note!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ))
            ]));
  }
}
