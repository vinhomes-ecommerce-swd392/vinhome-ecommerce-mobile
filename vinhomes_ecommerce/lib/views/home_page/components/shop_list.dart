import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_item.dart';

class ShopListView extends StatefulWidget {
  String title;

  ShopListView(this.title, {super.key});

  @override
  State<ShopListView> createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> {
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
                    .map((store) => ShopSmallCardView(
                          store: store,
                        ))
                    .toList())),
      ],
    );
  }
}
