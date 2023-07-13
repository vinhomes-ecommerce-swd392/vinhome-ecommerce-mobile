import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/product_card_item.dart';

import '../../../models/product.dart';

class SeperatedProductList extends StatelessWidget {
  List<Product> productList;
  SeperatedProductList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ShopSeperatedProductItem(
            product: productList[index],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        },
        itemCount: productList.length);
  }
}
