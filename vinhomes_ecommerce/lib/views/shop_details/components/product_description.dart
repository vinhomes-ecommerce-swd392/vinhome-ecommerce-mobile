import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final Product product;
  const ProductDescriptionWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 30),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "\$${product.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
      ),
      SizedBox(height: 20),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.description!,
          ),
        ),
      ),
    ]);
  }
}
