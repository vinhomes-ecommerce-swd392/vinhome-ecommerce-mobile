import 'package:flutter/material.dart';

import '../../../models/store.dart';
import '../../shop_details/shop_widget.dart';

class ShopSeperatedItem extends StatelessWidget {
  final Store store;
  ShopSeperatedItem({required this.store, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (content) => ShopWidget(shopId: store.id!)));
        },
        child: Material(
            // Wrap with Material widget
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(store.imageUrl,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors
                                .grey, // Fill color to display when the image is not found
                          );
                        })),
                    const SizedBox(width: 10), //Seperator
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(store.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text(store.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ))
                  ]),
            )));
  }
}
