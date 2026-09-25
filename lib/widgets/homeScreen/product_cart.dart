import 'package:flutter/material.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/screens/favorite_products_screen.dart';
import 'package:mini_store/state/favorite_provider.dart';
import 'package:mini_store/widgets/app_button.dart';
import 'package:mini_store/widgets/cart_snack_bar.dart';
import 'package:mini_store/widgets/quantity_selector.dart';

class ProductCard extends StatelessWidget {
  final ProductModels product;
  final VoidCallback addCart;
  final CartItemModel? cart;

  const ProductCard({
    super.key,
    required this.product,
    required this.addCart,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final favoriteState = FavoriteProvider.of(context);

    return Card(
      color: theme.surface,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    product.imagePath,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned.fill(
                  top: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.scrim, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
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
                              ScaffoldMessenger.of(context).removeCurrentSnackBar();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteProductsScreen(),));
                            },
                            icon: Icons.favorite
                            )
                          : CartSnackBarHelper.show(
                              context: context,
                              title:
                                  '${product.name} has been removed from your favorites.',
                             icon: Icons.heart_broken
                            );
                    },
                    child: Icon(
                      !product.isFavorite
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: !product.isFavorite ? theme.surface : theme.error,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              product.category.toString().split('.')[1].toUpperCase(),
              style: textTheme.labelLarge,
            ),

            const SizedBox(height: 8),

            Text(product.name, style: textTheme.titleLarge),
            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  '\$${product.price.toString()}',
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 8),
                if (product.oldPrice != null)
                  Text(
                    '\$${product.oldPrice.toString()}',
                    style: textTheme.labelLarge!.copyWith(
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: textTheme.labelLarge!.color,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 8),

            const Spacer(),
            if (cart == null)
              AppButton(
                onPressed: addCart,
                size: Size(double.infinity, 40),
                text: 'Add',
                icon: Icons.add_shopping_cart_outlined,
              )
            else
              QuantitySelector(cart: cart!),
          ],
        ),
      ),
    );
  }
}
