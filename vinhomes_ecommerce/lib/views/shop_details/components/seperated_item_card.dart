import 'package:flutter/material.dart';

import '../shop_item_details.dart';

class ShopSeperatedProductItem extends StatelessWidget {
  String productName;
  int id;
  String imageUrl;
  double price;
  ShopSeperatedProductItem(
      {super.key,
      required this.productName,
      required this.id,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (content) => ShopItemDetailPage(productId: id)));
        },
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 70,
                          width: 100,
                          child: Image.network(imageUrl,
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.fitWidth)),
                      const SizedBox(width: 3), //Seperator
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(price.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ))
                    ]))));
  }
}
