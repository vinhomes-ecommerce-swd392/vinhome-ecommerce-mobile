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
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ShopSmallCardView("KFC", "api_link", 4.0),
              ShopSmallCardView("KFC", "api_link", 4.0),
              ShopSmallCardView("KFC", "api_link", 4.0),
              ShopSmallCardView("KFC", "api_link", 4.0),
              ShopSmallCardView("KFC", "api_link", 4.0),
            ])),
      ],
    );
  }
}
