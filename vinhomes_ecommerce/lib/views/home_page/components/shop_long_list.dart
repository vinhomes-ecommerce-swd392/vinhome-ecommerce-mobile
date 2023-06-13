import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_item.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_long_item.dart';

class ShopLongListView extends StatelessWidget {
  String title;

  ShopLongListView(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(title),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ShopLongCardView(
                  "KFC Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                  "api_link",
                  4.0),
              ShopLongCardView("KFC", "api_link", 4.0),
              ShopLongCardView("KFC", "api_link", 4.0),
              ShopLongCardView("KFC", "api_link", 4.0),
              ShopLongCardView("KFC", "api_link", 4.0),
            ])),
      ],
    );
  }
}
