import 'package:flutter/material.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/screens/favorite_products_screen.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/favorite_provider.dart';
import 'package:mini_store/widgets/app_button.dart';
import 'package:mini_store/widgets/cart_snack_bar.dart';
import 'package:mini_store/widgets/quantity_selector.dart';
import 'package:mini_store/widgets/store_app_bar.dart';

class DetailsProductScreen extends StatelessWidget {
  final ProductModels product;
  const DetailsProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    final cartState = CartProvider.of(context);
    final appState = AppProvider.of(context);
    final favoriteState = FavoriteProvider.of(context);
    final cartitem = CartLogic.findCartItem(cartState.cartList, product.id);
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
      },
      child: Scaffold(
        appBar: StoreAppBar(title: 'Details Product'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    product.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        favoriteState.toggleFavorite(product);
                        product.isFavorite
                            ? CartSnackBarHelper.show(
                                context: context,
                                title:
                                    '${product.name} has been added to your favorites.',
                                onView: () {
                                  ScaffoldMessenger.of(
                                    context,
                                  ).removeCurrentSnackBar();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FavoriteProductsScreen(),
                                    ),
                                  );
                                },
                                icon: Icons.favorite,
                              )
                            : CartSnackBarHelper.show(
                                context: context,
                                title:
                                    '${product.name} has been removed from your favorites.',
                                icon: Icons.heart_broken,
                              );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:theme.scrim.withValues(alpha:0.5 ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          !product.isFavorite
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: !product.isFavorite
                              ? theme.surface
                              : theme.error,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDetailRow(
                      'Product ID',
                      product.id.toString(),
                      textTheme.titleLarge!,
                    ),
                    buildDetailRow(
                      'Product Name',
                      product.name,
                      textTheme.titleLarge!,
                    ),
                    buildDetailRow(
                      'Product Price',
                      product.price.toString(),
                      textTheme.titleLarge!,
                    ),
                    if (product.oldPrice != null)
                      buildDetailRow(
                        'Product OldPrice',
                        product.oldPrice.toString(),
                        textTheme.titleLarge!,
                      ),
                    buildDetailRow(
                      'Product Category',
                      product.category.name.toUpperCase(),
                      textTheme.titleLarge!,
                    ),
                    if (cartitem == null)
                      AppButton(
                        onPressed: () {
                          cartState.addCart(product);
                          appState.cartAdded();
                          CartSnackBarHelper.show(
                            context: context,
                            onView: () {
                              ScaffoldMessenger.of(
                                context,
                              ).removeCurrentSnackBar();
                              Navigator.pop(context);
                              appState.goCart();
                            },
                            title: 'Cart (${appState.cartBadgeCount} items)',
                            icon: Icons.shopping_bag_outlined,
                          );
                        },
                        size: Size(double.infinity, 40),
                        text: 'Add',
                        icon: Icons.add_shopping_cart_outlined,
                      )
                    else
                      QuantitySelector(cart: cartitem),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value, TextStyle theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme),
        Text(value, style: theme),
      ],
    );
  }
}
