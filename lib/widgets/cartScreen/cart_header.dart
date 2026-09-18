import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  final VoidCallback onBack;
  final int productQuantity;
  final bool isEmptyCart;
  final VoidCallback onDeleteAll;
  const CartHeader({
    super.key,
    required this.onBack,
    required this.productQuantity,
    required this.isEmptyCart,
    required this.onDeleteAll
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              theme.secondary.withValues(alpha: 0.15),
            ),
          ),
          onPressed: onBack,
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
            '$productQuantity items',
            style: textTheme.labelLarge!.copyWith(
              color: theme.onSecondaryContainer,
              fontSize: 12,
            ),
          ),
        ),
        Spacer(),
        if (!isEmptyCart)
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: theme.secondary.withValues(alpha: 0.15),
              minimumSize: Size.zero,
            ),
            onPressed: onDeleteAll,
            label: Text('Delete All'),
            icon: Icon(Icons.delete_rounded),
          ),
      ],
    );
  }
}
