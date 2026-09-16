import 'package:flutter/material.dart';
import 'package:mini_store/widgets/cartScreen/cart_empty.dart';
import 'package:mini_store/widgets/cartScreen/cart_state_info.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/cartScreen/cart_header.dart';
class CartScreen extends StatelessWidget {
  final VoidCallback onGoHome;
  const CartScreen({super.key,required this.onGoHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           CartHeader(onBack: onGoHome),
           const SizedBox(height: 24,),
           CartStateInfo(),
          
           Expanded(child: Center(child: CartEmpty(onExploreProducts:onGoHome))),
          ],
        ),
      ),
    );
  }
}
