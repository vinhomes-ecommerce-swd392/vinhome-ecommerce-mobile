import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_item.dart';

class ShopListView extends StatelessWidget {
  String title;

  final List _myList = List.generate(5, (index) {
    index = index + 1;
    return (shopName: "Shop $index", shopDesc: "Shop Desc $index", id: index);
  });

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
              ShopSmallCardView(
                shopId: 1,
                shopName: "Shop 1",
              ),
              ShopSmallCardView(
                shopId: 2,
                shopName: "Shop 2",
              ),
              ShopSmallCardView(
                shopId: 3,
                shopName: "Shop 3",
              ),
              ShopSmallCardView(
                shopId: 4,
                shopName: "Shop 4",
              ),
              ShopSmallCardView(
                shopId: 5,
                shopName: "Shop 5",
              ),
            ])),
      ],
    );
  }
}
