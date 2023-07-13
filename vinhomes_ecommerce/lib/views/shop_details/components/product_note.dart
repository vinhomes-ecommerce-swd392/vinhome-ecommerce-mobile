import 'package:flutter/material.dart';
import 'package:vinhomes_ecommerce/views/shop_details/components/text_input_widget.dart';

class ProductNoteWidget extends StatefulWidget {
  final Function(String) onTyping;
  const ProductNoteWidget({super.key, required this.onTyping});

  @override
  State<ProductNoteWidget> createState() => _ProductNoteWidgetState();
}

class _ProductNoteWidgetState extends State<ProductNoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text("Không bắt buộc"),
                  ],
                )),
            SizedBox(height: 15),
            TextInputWidget(onChangeText: (text) {
              widget.onTyping(text);
            }),
          ],
        ));
  }
}
