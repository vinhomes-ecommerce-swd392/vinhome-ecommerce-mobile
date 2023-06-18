import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_list.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_seperated_list.dart';
import 'package:vinhomes_ecommerce/views/home_page/search_page.dart';

import 'components/shop_long_list.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String keyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text("Good evening"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (content) => SearchPage()));
                    },
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  )),
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
      ),
    );
  }
}
