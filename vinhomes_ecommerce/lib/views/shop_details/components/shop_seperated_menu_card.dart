import 'package:flutter/material.dart';

class ShopSeperatedItem extends StatelessWidget {
  String shopName;
  String apiSourceUrl;
  double rating;
  ShopSeperatedItem(this.shopName, this.apiSourceUrl, this.rating, {super.key});

  @override
  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(1),
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
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: 10), // Separator
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/f/ff/Egg_Sandwich.jpg',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: 10), // Separator
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/f/ff/Egg_Sandwich.jpg',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: 10), // Separator
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/f/ff/Egg_Sandwich.jpg',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: 10), // Separator
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/f/ff/Egg_Sandwich.jpg',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    ),
  );
}
}
