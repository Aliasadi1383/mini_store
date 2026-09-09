import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/logics/home_logic.dart';
import 'package:mini_store/widgets/homeScreen/product_search_field.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/homeScreen/product_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filterProducts = HomeLogic.filterSearch(
      _searchController.text,
      products,
    );

    return Scaffold(
      appBar: StoreAppBar(title: 'Products'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 14),

            ProductSearchField(
              controller: _searchController,
              onChanged: (value) => setState(() {}),
              onClear: () {
                setState(() => _searchController.clear());
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: filterProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.52,
                ),
                itemBuilder: (context, index) {
                  return ProductCart(product: filterProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
