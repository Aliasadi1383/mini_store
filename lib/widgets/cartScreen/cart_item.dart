import 'package:flutter/material.dart';
import 'package:mini_store/models/cart_models.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/cart_state.dart';
import 'package:mini_store/widgets/quantity_selector.dart';

class CartItem extends StatelessWidget {
  
  final CartItemModel cart;

  const CartItem({
    super.key,

    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final CartState cartState=CartProvider.of(context);

    return Card(
      elevation: 2,
     margin: EdgeInsets.only(top: 12),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildCartImage(),

            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCartHeader(context),
                  Text(
                    '\$${cart.product.price.toStringAsFixed(2)} each',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  _buildTotalPrice(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPrice(BuildContext context) {
  final CartState cartState=CartProvider.of(context);
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '\$${(cart.product.price*cart.quantity).toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        QuantitySelector(
          // quantity: cart.quantity,
          cart: cart,
          //onIncrease: () => onIncrease(cart),
          //onDecrease: () => onDecrease(cart),
        ),
      ],
    );
  }

  Widget _buildCartHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            cart.product.name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,

            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          constraints: BoxConstraints(),
          onPressed: () => CartProvider.of(context).removeCart(cart),
          icon: Icon(Icons.delete_outline),
        ),
      ],
    );
  }

  Widget _buildCartImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(cart.product.imagePath, width: 80, height: 80, fit: BoxFit.cover),
    );
  }
}
