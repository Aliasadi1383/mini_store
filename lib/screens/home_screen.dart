import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/product/product_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: 'Products'),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.52,
        ),
        itemBuilder: (context, index) {
          return ProductCart(product: products[index]);
        },
      ),
    );
  }
}
