import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkrsupermarket/Screens/CartScreen.dart';
import 'package:mkrsupermarket/Screens/FavouriteScreen.dart';
import 'package:mkrsupermarket/Screens/HomeScreen.dart';
import 'package:mkrsupermarket/Screens/ProfileScreen.dart';
import 'package:mkrsupermarket/Screens/SettingScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
    SettingScreen()
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "HOME",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "FAVOURITES",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "CART",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "PROFILE",
                backgroundColor: Colors.orangeAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "SETTINGS",
                backgroundColor: Colors.orangeAccent),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 25,
          onTap: _onTapped,
          elevation: 5),
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
