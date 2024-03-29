import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../shop_details/components/text_input_widget.dart';

class ShippingInfoWidget extends StatefulWidget {
  final Function(String) onChange;
  const ShippingInfoWidget({super.key, required this.onChange});

  @override
  State<ShippingInfoWidget> createState() => _ShippingInfoWidgetState();
}

class _ShippingInfoWidgetState extends State<ShippingInfoWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.black; // Change color when focused
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Địa chỉ giao hàng",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(height: 15),
            TextField(
              controller: controller,
              onChanged: (value) => {widget.onChange(value)},
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
            ),
          ],
        ));
  }
}
