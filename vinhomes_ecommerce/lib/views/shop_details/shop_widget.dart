import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/view_models/product_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/product_card_list.dart';

import '../../models/order.dart';
import '../../view_models/order_view_model.dart';

class ShopWidget extends StatefulWidget {
  final String shopId;
  ShopWidget({super.key, required this.shopId});

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoreViewModel>(context, listen: false)
        .fetchStore(widget.shopId);
    Provider.of<ProductViewModel>(context, listen: false).fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    final productOnProvider = Provider.of<ProductViewModel>(context);
    final storeOnProvider = Provider.of<StoreViewModel>(context);

    var storeProductList = productOnProvider.productList
        .where((element) => element.storeId == storeOnProvider.store!.id)
        .toList();
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            pinned: true,
            onStretchTrigger: () {
              // Refresh the list, maybe
              return Future.value();
            },
            flexibleSpace: FlexibleSpaceBar(
              background: storeOnProvider.store != null
                  ? Image.network(storeOnProvider.store!.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors
                            .grey, // Fill color to display when the image is not found
                      );
                    })
                  : Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: productOnProvider.productList.isNotEmpty &&
                    storeOnProvider.store != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Card(
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                    child: Text(
                                      storeOnProvider.store!.name!,
                                      style: TextStyle(
                                          fontFamily: 'Abel',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: 5),
                                      Expanded(
                                          child: Text(
                                        storeOnProvider.store!.address!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.list_alt),
                                      SizedBox(width: 5),
                                      Expanded(
                                          child: Text(
                                        storeOnProvider.store!.description!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                    ],
                                  ),
                                )
                              ]),
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SeperatedProductList(
                              productList: storeProductList,
                            )),
                      ],
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    ));
  }
}
