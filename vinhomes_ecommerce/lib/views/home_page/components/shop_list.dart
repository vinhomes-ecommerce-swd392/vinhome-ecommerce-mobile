import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_item.dart';

class ShopListView extends StatelessWidget {
  String title;

  ShopListView(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(title),
        ),
        Container(
            height: 150,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ShopCardView("KFC", 4.0),
              ShopCardView("KFC", 4.0),
              ShopCardView("KFC", 4.0),
              ShopCardView("KFC", 4.0),
              ShopCardView("KFC", 4.0),
            ]))
      ],
    );
  }
}
