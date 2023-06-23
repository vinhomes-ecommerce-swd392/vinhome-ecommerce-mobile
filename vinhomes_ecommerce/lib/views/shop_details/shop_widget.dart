import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/view_models/product_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/seperated_product_list.dart';

class ShopWidget extends StatefulWidget {
  int shopId;
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
                  ? Image.network(storeOnProvider.store!.storeUrl,
                      fit: BoxFit.cover)
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
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(storeOnProvider.store!.storeName!),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SeperatedProductList(
                              productList: productOnProvider.productList,
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
