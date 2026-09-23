import 'package:flutter/material.dart';
import 'package:mini_store/state/cart_state.dart';

class CartProvider extends InheritedNotifier<CartState> {
  const CartProvider({
    super.key,
    required CartState cartState,
    required super.child,
    
  }) : super(notifier: cartState);

  static CartState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CartProvider>()!
        .notifier!;
  }
}

