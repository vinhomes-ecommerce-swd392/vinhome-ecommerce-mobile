import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/shop_seperated_menu_list.dart';



class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: SizedBox(
            height: 0,
            width: double.infinity,
            child: Text("Welcome to Lunch Shop")),
    ), Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text("Check out your order:"),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: SeperatedList()),
            ListTile(
              leading: Text("Choose your payment method"),
              title: Text("Momo"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),ListTile(
              leading: Text("Choose your payment method"),
              title: Text("COD"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    ),);
  }
}