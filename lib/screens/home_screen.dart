import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/logics/home_logic.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/widgets/homeScreen/product_category_filter.dart';
import 'package:mini_store/widgets/homeScreen/product_search_field.dart';
import 'package:mini_store/widgets/store_app_bar.dart';
import 'package:mini_store/widgets/homeScreen/product_cart.dart';

class HomeScreen extends StatefulWidget {
  final List<CartModels> cartList;
  final ValueChanged<CartModels> onIncrease;
  final ValueChanged<CartModels> onDecrease;
  final ValueChanged<ProductModels>onAddCart;
  const HomeScreen({
    super.key,
    required this.cartList,
    required this.onIncrease,
    required this.onDecrease,
    required this.onAddCart
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Categories? _selectedCategory;
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final cartitem = widget.cartList
                      .where(
                        (cart) => cart.product.id == filteredProducts[index].id,
                      )
                      .firstOrNull;

                  return ProductCart(
                    product: filteredProducts[index],
                    addCart: () {
                     widget.onAddCart(filteredProducts[index]);
                    },
                    cart: cartitem,
                    onIncrease: widget.onIncrease,
                    onDecrease: widget.onDecrease,
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

          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
