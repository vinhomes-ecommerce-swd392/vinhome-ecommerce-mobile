import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/store.dart';

class OrderItemWidget extends StatefulWidget {
  final Order order;
  final List<Store> storeList;
  const OrderItemWidget(
      {super.key, required this.order, required this.storeList});

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    Store store = widget.storeList
        .firstWhere((store) => store.id == widget.order.storeId);
    return Slidable(
        endActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Xoá',
              ),
            ]),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(store.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$${widget.order.total?.toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                )),
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(store.imageUrl,
                        alignment: Alignment.bottomCenter, fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors
                            .grey, // Fill color to display when the image is not found
                      );
                    })),
              ],
            )));
  }
}
