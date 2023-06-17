import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_seperated_card.dart';

class SeperatedList extends StatelessWidget {
  SeperatedList({super.key});
  final List _myList = List.generate(
    5,
    (index) => (shopName: "Shop $index", shopDesc: "Shop Desc $index"),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ShopSeperatedItem(
              _myList[index].shopName, _myList[index].shopDesc, 3.5);
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        },
        itemCount: _myList.length);
  }
}