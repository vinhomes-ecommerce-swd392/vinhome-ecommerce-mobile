import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/text_input_widget.dart';

import '../../resources/dismiss_keyboard_widget.dart';
import 'components/product_quantity_widget.dart';
// ignore_for_file: prefer_const_constructors

class ShopItemDetailPage extends StatefulWidget {
  String itemName;
  double itemPrice;
  ShopItemDetailPage(
      {super.key, required this.itemName, required this.itemPrice});

  @override
  State<ShopItemDetailPage> createState() => _ShopItemDetailPageState();
}

class _ShopItemDetailPageState extends State<ShopItemDetailPage> {
  int? itemQuantity;

  @override
  void initState() {
    super.initState();
    itemQuantity = 1;
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
    return Scaffold(
        body: SafeArea(
            child: DismissKeyboard(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                        'https://s.memehay.com/files/posts/20200912/thanh-nien-deo-kinh-noi-hom-nay-len-mang-the-la-du-roi-6d36dfb54b646e1cdc937c0a706143b0.jpg',
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth)),
                Positioned(
                    top: 20,
                    left: 20,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_left_sharp),
                      label: const Text('Back'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.itemName!,
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
                      "\$" + widget.itemPrice!.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
                        (widget.itemPrice! * itemQuantity!).toStringAsFixed(2),
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
        ),
      ),
    )));
  }
}
