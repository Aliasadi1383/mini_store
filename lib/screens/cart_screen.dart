import 'package:flutter/material.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/widgets/cartScreen/cart_empty.dart';
import 'package:mini_store/widgets/cartScreen/cart_item.dart';
import 'package:mini_store/widgets/cartScreen/cart_state_info.dart';
import 'package:mini_store/widgets/cartScreen/cart_summary.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/cartScreen/cart_header.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = CartProvider.of(context);

    return Scaffold(
      appBar: StoreAppBar(title: 'Cart'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CartHeader(),
                const SizedBox(height: 24),
                CartStateInfo(),

                if (cartState.cartList.isNotEmpty) ...[
                  const SizedBox(height: 12),

                  ...cartState.cartList.map((cart) {
                    return CartItem(cart: cart);
                  }),
                  const SizedBox(height: 12),
                  CartSummary(),
                ],
              ]),
            ),
          ),
          if (cartState.cartList.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CartEmpty()),
            ),
        ],
      ),
    );
  }
}
