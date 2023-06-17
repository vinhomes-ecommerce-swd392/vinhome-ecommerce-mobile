import 'package:flutter/material.dart';

class ShopSeperatedItem extends StatelessWidget {
  String shopName;
  String apiSourceUrl;
  double rating;
  ShopSeperatedItem(this.shopName, this.apiSourceUrl, this.rating, {super.key});

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/f/ff/Egg_Sandwich.jpg',
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitWidth)),
              const SizedBox(width: 10), //Seperator
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
            ])
  );
}
}
