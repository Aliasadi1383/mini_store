import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_button.dart';

class CartEmpty extends StatelessWidget {
  final VoidCallback onExploreProducts;
  const CartEmpty({super.key,required this.onExploreProducts});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: theme.tertiaryFixedDim.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.shopping_bag, size: 50, color: theme.primary),
        ),

        const SizedBox(height: 20),
        Text(
          'Your cart is empty',
          style: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          'Browse products to start shopping and\n'
          'discover new weekly tech drops.',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),

        AppButton(
          size: Size(200, 50),
          text: 'Explore Products',
          icon: Icons.storefront,
          onPressed: onExploreProducts,
        ),
      ],
    );
  }
}
