import 'package:flutter/material.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/widgets/cartScreen/cart_empty.dart';
import 'package:mini_store/widgets/cartScreen/cart_item.dart';
import 'package:mini_store/widgets/cartScreen/cart_state_info.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/cartScreen/cart_header.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onGoHome;
  final List<CartModels> cartList;
  const CartScreen({super.key, required this.onGoHome, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CartHeader(onBack: onGoHome),
            const SizedBox(height: 24),
            CartStateInfo(),
            if (cartList.isEmpty)
              Expanded(
                child: Center(child: CartEmpty(onExploreProducts: onGoHome)),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      imagePath: cartList[index].product.imagePath,
                      name: cartList[index].product.name,
                      price:cartList[index].product.price ,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
