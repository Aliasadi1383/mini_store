import 'package:flutter/material.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/cart_state.dart';

class QuantitySelector extends StatelessWidget {
  final CartItemModel cart;
  const QuantitySelector({
    super.key,
    required this.cart
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final CartState cartState=CartProvider.of(context);
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
            onPressed: cart.quantity == 1 ? null :()=> cartState.decreaseQuantity(cart),
            icon: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          Text(
            cart.quantity.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: theme.primary,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            color: Colors.white,
            style: IconButton.styleFrom(backgroundColor: theme.primary),
            onPressed:()=> cartState.increaseQuantity(cart),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
