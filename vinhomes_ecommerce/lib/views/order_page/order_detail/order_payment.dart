import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Icon(Icons.wallet),
                  padding: EdgeInsets.all(5),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phuong thuc thanh toan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Ghi chu',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ]),
                Expanded(child: Icon(Icons.arrow_right))
              ])),
      onTap: () {
        _showModalBottomSheet(context);
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the bottom sheet's appearance
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                title: Text('Payment Method 1'),
                onTap: () {
                  // Update the payment method in your cart or state
                  // Example: cart.paymentMethod = 'Payment Method 1';
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                title: Text('Payment Method 2'),
                onTap: () {
                  // Update the payment method in your cart or state
                  // Example: cart.paymentMethod = 'Payment Method 2';
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              // Add more payment method options as needed
            ],
          ),
        );
      },
    );
  }
}
