import 'package:flutter/material.dart';
import 'package:mini_store/screens/cart_screen.dart';
import 'package:mini_store/screens/home_screen.dart';
import 'package:mini_store/widgets/store_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;


  List<Widget> get pages => [
    HomeScreen(),
   CartScreen(onGoHome: () {
     setState(() {
       _selectedIndex=0;
     });
   },)];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
