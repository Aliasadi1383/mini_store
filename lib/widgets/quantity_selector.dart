import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.tertiaryFixedDim.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.black,
            style: IconButton.styleFrom(
              backgroundColor: theme.surface,
              disabledBackgroundColor: theme.surfaceContainerHighest,
             
            ),
            onPressed: quantity == 1 ? null : onDecrease,
            icon: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          Text(
            quantity.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: theme.primary,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            color: Colors.white,
            style: IconButton.styleFrom(backgroundColor: theme.primary),
            onPressed: onIncrease,
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
