import 'package:flutter/material.dart';

class ShopLongCardView extends StatelessWidget {
  String shopName;
  String apiSourceUrl;
  double rating;
  ShopLongCardView(this.shopName, this.apiSourceUrl, this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: 250,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Image
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            'https://s.memehay.com/files/posts/20200912/thanh-nien-deo-kinh-noi-hom-nay-len-mang-the-la-du-roi-6d36dfb54b646e1cdc937c0a706143b0.jpg',
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitWidth)),
                    const SizedBox(width: 10), //Seperator
                    // Product, shop info
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shopName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text(shopName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ))
                  ]),
            )));
  }
}
