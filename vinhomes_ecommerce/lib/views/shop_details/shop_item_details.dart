import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/models/order.dart';
import 'package:vinhomes_ecommerce/models/product.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/add_to_cart_button.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/product_description.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/product_note.dart';

import '../../resources/dismiss_keyboard_widget.dart';
import '../../view_models/order_view_model.dart';
import '../../view_models/product_view_model.dart';
import 'components/product_quantity_widget.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors

class ShopItemDetailPage extends StatefulWidget {
  String productId;
  int? itemQuantity;
  ShopItemDetailPage({super.key, required this.productId, this.itemQuantity});

  @override
  State<ShopItemDetailPage> createState() => _ShopItemDetailPageState();
}

class _ShopItemDetailPageState extends State<ShopItemDetailPage> {
  int? itemQuantity;
  String noteForStore = '';

  @override
  void initState() {
    super.initState();

    itemQuantity = (widget.itemQuantity != null) ? widget.itemQuantity : 1;
    Provider.of<ProductViewModel>(context, listen: false)
        .fetchProduct(widget.productId);
    Provider.of<OrderViewModel>(context, listen: false)
        .fetchOrderListByUser("some user id");
  }

  void changeQuantity(bool isAdding) {
    setState(() {
      if (isAdding) {
        itemQuantity = itemQuantity! + 1;
      } else {
        if (itemQuantity! > 1) itemQuantity = itemQuantity! - 1;
      }
    });
  }

  void onNoteTyping(String text) {
    setState(() {
      noteForStore = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productOnProvider = Provider.of<ProductViewModel>(context);
    var currentProduct = productOnProvider.product;

    final orderOnProvider = Provider.of<OrderViewModel>(context);

    var storeCurrentCart = orderOnProvider.orderList.firstWhereOrNull((order) =>
        currentProduct != null &&
        order.storeId == currentProduct.storeId &&
        order.status == OrderStatus.InCart.index + 1);
    return Scaffold(
        body: DismissKeyboard(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 200,
          stretch: true,
          pinned: true,
          onStretchTrigger: () {
            // Refresh the list, maybe
            return Future.value();
          },
          flexibleSpace: FlexibleSpaceBar(
            background: productOnProvider.product != null
                ? Image.network(currentProduct!.imageUrl, fit: BoxFit.cover,
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
          child: productOnProvider.product != null
              ? Column(
                  children: [
                    ProductDescriptionWidget(product: currentProduct!),
                    SizedBox(height: 20),
                    Divider(thickness: 5),
                    SizedBox(height: 20),
                    ProductNoteWidget(onTyping: onNoteTyping),
                    SizedBox(
                      height: 15,
                    ),
                    ItemQuantityWidget(itemQuantity!, changeQuantity),
                    SizedBox(
                      height: 15,
                    ),
                    AddToCartButton(
                        product: productOnProvider.product!,
                        quantity: itemQuantity!,
                        note: noteForStore,
                        storeCurrentCart: storeCurrentCart),
                    SizedBox(height: 30),
                  ],
                )
              : Container(
                  width: double.infinity,
                  height: 500,
                  child: Center(child: CircularProgressIndicator()),
                ),
        )
      ]),
    ));
  }
}
