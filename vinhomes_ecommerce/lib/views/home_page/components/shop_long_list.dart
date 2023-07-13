import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_long_item.dart';

import '../../../view_models/store_view_model.dart';

class ShopLongListView extends StatefulWidget {
  String title;

  ShopLongListView(this.title, {super.key});

  @override
  State<ShopLongListView> createState() => _ShopLongListViewState();
}

class _ShopLongListViewState extends State<ShopLongListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoreViewModel>(context, listen: false).fetchStoreList();
  }

  @override
  Widget build(BuildContext context) {
    final storeOnProvider = Provider.of<StoreViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(3),
          child: Text(widget.title),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: storeOnProvider.storeList
                    .map((store) => ShopLongCardView(
                          store: store,
                        ))
                    .toList())),
      ],
    );
  }
}
