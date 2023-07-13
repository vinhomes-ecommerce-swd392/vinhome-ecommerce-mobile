import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinhomes_ecommerce/resources/utils/firebase_utils.dart';
import 'package:vinhomes_ecommerce/view_models/order_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/product_view_model.dart';
import 'package:vinhomes_ecommerce/view_models/store_view_model.dart';
import 'firebase_options.dart';
import "views/login.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
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
        ChangeNotifierProvider(create: (context) => OrderViewModel()),
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
