import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/views/home_page/components/shop_seperated_card.dart';

import '../../../view_models/store_view_model.dart';

class SeperatedList extends StatefulWidget {
  SeperatedList({super.key});

  @override
  State<SeperatedList> createState() => _SeperatedListState();
}

class _SeperatedListState extends State<SeperatedList> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoreViewModel>(context, listen: false).fetchStoreList();
  }

  @override
  Widget build(BuildContext context) {
    final storeOnProvider = Provider.of<StoreViewModel>(context);
    return storeOnProvider.storeList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ShopSeperatedItem(
                store: storeOnProvider.storeList[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).primaryColor,
              );
            },
            itemCount: storeOnProvider.storeList.length)
        : Container(
            width: double.infinity,
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
