import 'package:flutter/material.dart';
import '../../../models/store.dart';
import '../../shop_details/shop_widget.dart';

class ShopSmallCardView extends StatelessWidget {
  final Store store;
  ShopSmallCardView({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (content) => ShopWidget(shopId: store.id!)));
      },
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(store.imageUrl,
                  alignment: Alignment.bottomCenter, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors
                      .grey, // Fill color to display when the image is not found
                );
              })),
          SizedBox(
              height: 40,
              width: 100,
              child: Text(store.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyMedium)),
        ]),
      )),
    );
  }
}
