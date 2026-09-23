import 'package:flutter/material.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.of(context);
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final cartState=CartProvider.of(context);


    return Row(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              theme.secondary.withValues(alpha: 0.15),
            ),
          ),
          onPressed: appState.goHome,
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 10),
        Text(
          'My Cart',
          style: textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: theme.secondaryContainer,

            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${cartState.cartList.length} items',
            style: textTheme.labelLarge!.copyWith(
              color: theme.onSecondaryContainer,
              fontSize: 12,
            ),
          ),
        ),
        Spacer(),
        if (cartState.cartList.isNotEmpty)
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: theme.secondary.withValues(alpha: 0.15),
              minimumSize: Size.zero,
            ),
            onPressed: cartState.deleteAllCart,
            label: Text('Delete All'),
            icon: Icon(Icons.delete_rounded),
          ),
      ],
    );
  }
}
