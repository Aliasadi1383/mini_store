import 'package:flutter/material.dart';
import 'package:mini_store/data/products_data.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/favorite_provider.dart';
import 'package:mini_store/widgets/cart_snack_bar.dart';
import 'package:mini_store/widgets/homeScreen/product_cart.dart';
import 'package:mini_store/widgets/store_app_bar.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteProvider.of(context);
    final cartState = CartProvider.of(context);
    final appState = AppProvider.of(context);
    final filterFavorite = products
        .where((product) => product.isFavorite)
        .toList();

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
         ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
      },
      child: Scaffold(
        appBar: StoreAppBar(title: 'Favorite Products'),
      
        body:filterFavorite.isNotEmpty? GridView.builder(
          padding: EdgeInsets.all(15),
          itemCount: filterFavorite.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.52,
          ),
          itemBuilder: (context, index) {
            final cartitem = CartLogic.findCartItem(cartState.cartList, filterFavorite[index].id);
      
            return ProductCard(
              product: filterFavorite[index],
              addCart: () {
                cartState.addCart(filterFavorite[index]);
                appState.cartAdded();
                CartSnackBarHelper.show(
                  context: context,
                  onView: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    Navigator.pop(context);
                    appState.goCart();
                  },
                  title: 'Cart (${appState.cartBadgeCount} items)',
                  icon: Icons.shopping_bag_outlined,
                );
              },
              cart: cartitem,
            );
          },
        ):Center(child: Text('You don\'t have any favorite products yet.',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
        ),),),
      ),
    );
  }
}
