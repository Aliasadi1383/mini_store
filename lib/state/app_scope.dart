import 'package:flutter/material.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/app_state.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/cart_state.dart';

class AppScope extends StatefulWidget {
  final Widget child;
  const AppScope({super.key, required this.child});

  @override
  State<AppScope> createState() {
    return _AppScopeState();
  }
}

class _AppScopeState extends State<AppScope> {
  final AppState appState = AppState();
  final CartState cartState = CartState();

  @override
  dispose() {
    appState.dispose();
    cartState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    return AppProvider(
      appState: appState,
      child: CartProvider(cartState: cartState, child: widget.child),
    );
  }
}
