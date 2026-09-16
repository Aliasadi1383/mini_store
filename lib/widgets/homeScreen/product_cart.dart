import 'package:flutter/material.dart';
import 'package:mini_store/models/product_models.dart';
import 'package:mini_store/widgets/app_button.dart';

class ProductCart extends StatelessWidget {
  final ProductModels product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      color: theme.surface,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            AppButton(
              onPressed: () {
                
              },
              size: Size(double.infinity, 40),
              text: 'Add',
              icon: Icons.add_shopping_cart_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
