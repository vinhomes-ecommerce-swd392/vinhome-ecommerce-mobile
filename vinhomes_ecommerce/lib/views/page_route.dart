import 'package:flutter/material.dart';
import '../resources/bottom_nav_bar.dart';
import 'home_page/home_widget.dart';
import 'home_page/search_page.dart';
import 'shop_details/shop_widget.dart';

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
        return ShopWidget();
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
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Text('Cart View'),
  //   );
  // }


  List<String> cartItems= ['Item 1', 'Item 2', 'Item 3']; // Assuming cartItems is a list of item names

  CartWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cart View',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            'Items in Cart:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          for (var item in cartItems)
            Text(
              item,
              style: TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }
}



class OrdersWidget extends StatelessWidget {
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

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ProfileWidget View'),
    );
  }
}
