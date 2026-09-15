import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

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
          onPressed: () {},
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
            '0 items',
            style: textTheme.labelLarge!.copyWith(
              color: theme.onSecondaryContainer,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
