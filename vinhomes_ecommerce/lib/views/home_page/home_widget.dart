import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_item.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_list.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_seperated_list.dart';

import 'components/shop_long_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text("Good evening"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SearchBar(),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ShopListView("Đề xuất cho bạn")),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ShopLongListView("Ưu đãi chớp nhoáng")),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: SeperatedList()),
          ],
        ),
      ),
    );
  }
}
