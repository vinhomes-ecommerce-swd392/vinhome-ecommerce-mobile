import 'package:flutter/material.dart';

class ShopItemDetailPage extends StatefulWidget {
  String? itemName;
  double? itemPrice;
  ShopItemDetailPage({super.key, this.itemName, this.itemPrice});

  @override
  State<ShopItemDetailPage> createState() => _ShopItemDetailPageState();
}

class _ShopItemDetailPageState extends State<ShopItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_left_sharp),
                            Text("Back")
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(widget.itemName!),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
