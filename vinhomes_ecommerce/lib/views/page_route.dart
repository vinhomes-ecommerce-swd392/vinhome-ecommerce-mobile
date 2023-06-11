import 'package:flutter/material.dart';
import '../resources/bottom_nav_bar.dart';
import 'home_page/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        return CartWidget();
      case 2:
        return OrdersWidget();
      case 3:
        return ProfileWidget();
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

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart View'),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Order View'),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ProfileWidget View'),
    );
  }
}
