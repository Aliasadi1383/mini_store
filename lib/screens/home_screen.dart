import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/logics/home_logic.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/screens/details_product_screen.dart';
import 'package:mini_store/screens/favorite_products_screen.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/favorite_provider.dart';
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final favoriteState=FavoriteProvider.of(context);

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
      appBar: StoreAppBar(
        title: 'Products',
        iconButton: Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteProductsScreen(),
                  ),
                );
              },
              icon: Icon(Icons.favorite_border),
            ),
            if (favoriteState.hasFavorite())
              Positioned(
                bottom: 15,
                right: 0,
                left: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
      body:    
      CustomScrollView(
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
                  final cartitem = CartLogic.findCartItem(cartState.cartList, filteredProducts[index].id);

                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsProductScreen(product: filteredProducts[index])));
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    child: ProductCard(
                      product: filteredProducts[index],
                      addCart: () {
                        cartState.addCart(filteredProducts[index]);
                        appState.cartAdded();
                        CartSnackBarHelper.show(
                          context: context,
                          onView: () {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            appState.goCart();
                          },
                          title: 'Cart (${appState.cartBadgeCount} items)',
                          icon: Icons.shopping_bag_outlined,
                        );
                     
                      },
                    
                      cart: cartitem,
                    ),
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
