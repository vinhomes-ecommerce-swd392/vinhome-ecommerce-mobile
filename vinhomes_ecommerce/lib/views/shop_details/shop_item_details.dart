import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/text_input_widget.dart';

import '../../resources/dismiss_keyboard_widget.dart';
import '../../view_models/product_view_model.dart';
import 'components/product_quantity_widget.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors

class ShopItemDetailPage extends StatefulWidget {
  int productId;
  ShopItemDetailPage({super.key, required this.productId});

  @override
  State<ShopItemDetailPage> createState() => _ShopItemDetailPageState();
}

class _ShopItemDetailPageState extends State<ShopItemDetailPage> {
  int? itemQuantity;

  @override
  void initState() {
    super.initState();
    itemQuantity = 1;
    Provider.of<ProductViewModel>(context, listen: false)
        .fetchProduct(widget.productId);
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

  @override
  Widget build(BuildContext context) {
    final productOnProvider = Provider.of<ProductViewModel>(context);
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
                ? Image.network(productOnProvider.product!.productUrl,
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
          child: productOnProvider.product != null
              ? Column(
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                productOnProvider.product!.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "\$${productOnProvider.product!.originalPrice}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productOnProvider.product!.description!,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 5),
                    SizedBox(height: 20),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Thêm lưu ý cho quán",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Không bắt buộc",
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            TextInputWidget(
                              onChangeText: (p0) {},
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    ItemQuantityWidget(itemQuantity!, changeQuantity),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        color: Color.fromRGBO(41, 45, 50, 1),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.shopping_cart, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Thêm vào giỏ hàng',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Abel',
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '\$' +
                                (productOnProvider.product!.originalPrice *
                                        itemQuantity!)
                                    .toStringAsFixed(2),
                            style: TextStyle(
                              color: Color.fromRGBO(40, 184, 150, 1),
                              fontFamily: 'Abel',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : Container(
                  width: double.infinity,
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        )
      ]),
    ));
  }
}
