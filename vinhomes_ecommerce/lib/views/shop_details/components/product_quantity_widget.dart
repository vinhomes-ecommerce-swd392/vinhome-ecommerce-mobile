import 'package:flutter/material.dart';

class ItemQuantityWidget extends StatefulWidget {
  final Function(bool) changeQuantity;
  final int itemQuantity;

  const ItemQuantityWidget(this.itemQuantity, this.changeQuantity, {super.key});

  @override
  State<ItemQuantityWidget> createState() => _ItemQuantityWidgetState();
}

class _ItemQuantityWidgetState extends State<ItemQuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: () {
                widget.changeQuantity(false);
              },
              icon: Icon(Icons.remove),
            ),
          ),
          SizedBox(width: 15),
          Text(
            widget.itemQuantity.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 0.8),
          ),
          SizedBox(width: 15),
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: () {
                widget.changeQuantity(true);
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
