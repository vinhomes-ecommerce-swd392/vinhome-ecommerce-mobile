import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/shop_seperated_menu_list.dart';



class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            Padding(
      padding: EdgeInsets.all(1),
      child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.network(
                'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth)),
    ), const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text("Welcome to Lunch Shop"),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: SeperatedList()),
          ],
        ),
      ),
    );
  }
}