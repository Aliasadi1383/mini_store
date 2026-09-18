import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  final int numberItemCart;
  const CartBadge({super.key,required this.numberItemCart});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme=Theme.of(context).colorScheme;
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: theme.surface),
      child: Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.error.withValues(alpha: 0.8, red: 1),
          shape: BoxShape.circle,
        ),
        child: Text(
          numberItemCart.toString(),
          style: TextStyle(
            color: theme.onError,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
