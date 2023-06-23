import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/shop_item_details.dart';

import '../../shop_details/checkout_widget.dart';
import '../../shop_details/shop_widget.dart';

class ShopSmallCardView extends StatefulWidget {
  int shopId;
  String shopName;
  ShopSmallCardView({super.key, required this.shopId, required this.shopName});

  @override
  State<ShopSmallCardView> createState() => _ShopSmallCardViewState();
}

class _ShopSmallCardViewState extends State<ShopSmallCardView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (content) => ShopWidget(shopId: widget.shopId)));
      },
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(3),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                  'https://s.memehay.com/files/posts/20200912/thanh-nien-deo-kinh-noi-hom-nay-len-mang-the-la-du-roi-6d36dfb54b646e1cdc937c0a706143b0.jpg',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitHeight)),
          SizedBox(
              height: 40,
              child: Text(widget.shopName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyMedium)),
        ]),
      )),
    );
  }
}
