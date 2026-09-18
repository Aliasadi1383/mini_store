import 'package:flutter/material.dart';

class CartSnackBar extends StatelessWidget {
  final int numberItemCart;
  final VoidCallback onViewCart;
  const CartSnackBar({
    super.key,required this.numberItemCart,
    required this.onViewCart
    });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.shopping_bag_outlined, color: theme.onPrimary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart ($numberItemCart items)',
                style: textTheme.bodyMedium!.copyWith(
                  color: theme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Reactive State Demo',
                style: textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: theme.primary,
          ),
          onPressed: onViewCart,
          child: Row(
            children: [
              Text('View', style: textTheme.labelMedium),
              Icon(Icons.arrow_forward, color: theme.onPrimary,size: 20,),
            ],
          ),
        ),
      ],
    );
  }
}
