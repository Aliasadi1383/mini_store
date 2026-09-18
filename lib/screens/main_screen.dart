import 'package:flutter/material.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/screens/cart_screen.dart';
import 'package:mini_store/screens/home_screen.dart';
import 'package:mini_store/widgets/cart_snack_bar.dart';
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

  bool hasNewCartItem = false;

  int newCartItems = 0;

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
          CartLogic.addProductCart(
            CartModels(product: product, quantity: 1),
            cartList,
          );
          hasNewCartItem = true;
          newCartItems++;
        });
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: EdgeInsets.only(right: 20, left: 20, bottom: 16),
            content: CartSnackBar(
              numberItemCart: newCartItems,
              onViewCart: () {
                setState(() {
                  _selectedIndex = 1;
                  hasNewCartItem = false;
                  newCartItems = 0;
                });
                ScaffoldMessenger.of(context).clearSnackBars();
              },
            ),
          ),
        );
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
      onDeleteAll: () {
        setState(() {
          cartList.clear();
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
            if (index == 1) {
              hasNewCartItem = false;
              newCartItems = 0;
            }
          });
          if (index == 1) {
            ScaffoldMessenger.of(context).clearSnackBars();
          }
        },
        numberItemCart: newCartItems,
        hasNewCartitem: hasNewCartItem,
      ),
    );
  }
}
