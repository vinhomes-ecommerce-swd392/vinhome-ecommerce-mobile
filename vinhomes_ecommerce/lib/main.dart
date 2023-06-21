import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/view_models/product_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import "views/login.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
        ChangeNotifierProvider(create: (context) => StoreViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: Center(
            child: LoginPage(),
          ),
        )),
      ),
    );
  }
}
