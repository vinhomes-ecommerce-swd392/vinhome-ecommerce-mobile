import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/shop_seperated_menu_card.dart';

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
              _myList[index].shopName, _myList[index].shopDesc, 2.2);
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        },
        itemCount: _myList.length);
  }
}
