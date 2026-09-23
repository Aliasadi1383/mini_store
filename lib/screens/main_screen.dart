import 'package:flutter/material.dart';
import 'package:mini_store/screens/cart_screen.dart';
import 'package:mini_store/screens/home_screen.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/widgets/store_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pages = const [HomeScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.of(context);

    return Scaffold(
      body: pages[appState.selectedIndex],
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
