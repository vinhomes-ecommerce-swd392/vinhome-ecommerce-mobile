import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../resources/bottom_nav_bar.dart';
import 'cart_page/cart_list.dart';
import 'home_page/home_widget.dart';
import 'home_page/search_page.dart';
import 'order_page/order_list.dart';
import 'shop_details/shop_widget.dart';
import 'user_profile/user_profile.dart';

class HomePage extends StatelessWidget {
  User? user;

  HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildChildWidget() {
    switch (_selectedIndex) {
      case 0:
        return HomeWidget();
      case 1:
        return CartList();
      case 2:
        return OrderList();
      case 3:
        return UserProfilePage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildChildWidget(),
      bottomNavigationBar:
          BottomNavBar(currentIndex: _selectedIndex, onItemTap: _onItemTapped),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (content) => SearchPage()));
        },
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
