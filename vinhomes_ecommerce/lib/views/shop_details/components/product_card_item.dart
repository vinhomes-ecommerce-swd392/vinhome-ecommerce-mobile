import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/product.dart';

import '../shop_item_details.dart';

class ShopSeperatedProductItem extends StatelessWidget {
  final Product product;
  ShopSeperatedProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (content) =>
                      ShopItemDetailPage(productId: product.id!)));
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
                          child: Image.network(product.imageUrl,
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors
                                  .grey, // Fill color to display when the image is not found
                            );
                          })),
                      const SizedBox(width: 3), //Seperator
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(product.price.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ))
                    ]))));
  }
}
