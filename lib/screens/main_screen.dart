import 'package:flutter/material.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/models/cart_models.dart';
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

  List<CartModels> cartList = [];

  List<Widget> get pages => [
    HomeScreen(
      cartList: cartList,
      onIncrease: (cart) {
        setState(() {
          CartLogic.increaseQuantity(cart);
        });
      },
      onDecrease: (cart) {
        setState(() {
          CartLogic.decreaseQuantity(cart);
          
        });
      },
      onAddCart: (product) {
        setState(() {
          CartLogic.addProductCart(CartModels(product: product, quantity: 1), cartList);
        });
      },
    ),
    CartScreen(
      cartList: cartList,
      onGoHome: () {
        setState(() {
          _selectedIndex = 0;
        });
      },
      onIncrease: (cart) {
        setState(() {
          CartLogic.increaseQuantity(cart);
        });
      },
      onDecrease: (cart) {
        setState(() {
            CartLogic.decreaseQuantity(cart);
        });
      },
      onDeleted: (cart) {
        setState(() {
          CartLogic.removeProductCart(cart, cartList);
        });
      },
    ),
  ];

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
