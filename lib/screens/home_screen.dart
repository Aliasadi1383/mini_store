import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/logics/home_logic.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/widgets/cart_snack_bar.dart';
import 'package:mini_store/widgets/homeScreen/product_category_filter.dart';
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
  Categories? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final cartState = CartProvider.of(context);
    final appState = AppProvider.of(context);
    final searchedProducts = HomeLogic.filterSearch(
      _searchController.text,
      products,
    );

    final filteredProducts = HomeLogic.filterCategory(
      _selectedCategory,
      searchedProducts,
    );

    return Scaffold(
      appBar: const StoreAppBar(title: 'Products'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            sliver: SliverToBoxAdapter(
              child: ProductSearchField(
                controller: _searchController,
                onChanged: (value) => setState(() {}),
                onClear: () {
                  setState(() => _searchController.clear());
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: ProductCategoryFilter(
              selectedCategory: _selectedCategory,
              onCategorySelected: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
          ),

          if (filteredProducts.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(
                  'The requested product was not found.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 15,
                left: 15,
                top: 12,
                bottom: 60,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final cartitem = cartState.cartList
                      .where(
                        (cart) => cart.product.id == filteredProducts[index].id,
                      )
                      .firstOrNull;

                  return ProductCard(
                    product: filteredProducts[index],
                    addCart: () {
                      cartState.addCart(filteredProducts[index]);
                      appState.cartAdded();
                      CartSnackBarHelper.show(context: context);
                    },

                    cart: cartitem,
                  );
                }, childCount: filteredProducts.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.52,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
