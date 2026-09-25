import 'package:flutter/material.dart';
import 'package:mini_store/logics/cart_logic.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/cart_provider.dart';
import 'package:mini_store/state/favorite_provider.dart';
import 'package:mini_store/widgets/app_button.dart';
import 'package:mini_store/widgets/cartScreen/order_success_dialog.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppProvider.of(context);
    final cartState = CartProvider.of(context);
    final favorite = FavoriteProvider.of(context);
    final subtotal = CartLogic.subTotal(cartState.cartList);
    final discount = CartLogic.discount(subtotal);
    final tax = CartLogic.tax(subtotal);
    final discountAmount = CartLogic.discountAmount(subtotal, discount);
    final taxAmount = CartLogic.taxAmount(subtotal, tax);
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 2,
      color: theme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Order Summary', style: textTheme.titleLarge),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    '${CartLogic.totalQuantity(cartState.cartList)} items (${cartState.cartList.length} distinct products)',
                    style: textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: textTheme.bodyMedium),
                Text(
                  '\$${subtotal.toStringAsFixed(2)}',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            _summaryRow(
              title: 'Discount',
              percentage: discount,
              amount: discountAmount,
              textTheme: textTheme,
              color: theme.tertiary.withValues(green: 0.75),
              isDiscount: true,
            ),
            const SizedBox(height: 8),
            _summaryRow(
              title: 'Estimated Tax',
              percentage: tax,
              amount: taxAmount,
              textTheme: textTheme,
              color: theme.error.withValues(red: 0.9),
              isDiscount: false,
            ),
            const SizedBox(height: 16),
            Divider(color: theme.surfaceDim, thickness: 2),
            const SizedBox(height: 16),
            Text(
              'TOTAL AMOUNT',
              style: textTheme.labelLarge!.copyWith(
                color: theme.scrim.withValues(alpha: 0.7),
                fontSize: 11,
              ),
            ),
            Text(
              '\$${CartLogic.totalAmount(subtotal, discountAmount, taxAmount).toStringAsFixed(2)}',
              style: textTheme.headlineSmall!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.primary,
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              size: Size(double.infinity, 52),
              text: 'Submit Order',
              icon: Icons.lock_outline,
              endIcon: Icons.arrow_forward,
              onPressed: () {
                OrderSuccessDialogHelper.show(context, () {
                  favorite.clearCartFavorite(cartState.cartList);
                  cartState.deleteAllCart();
                  appState.goHome();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow({
    required String title,
    required int percentage,
    required double amount,
    required TextTheme textTheme,
    required Color color,
    required bool isDiscount,
  }) {
    return Row(
      children: [
        Expanded(child: Text(title, style: textTheme.bodyMedium)),
        Expanded(
          child: Text(
            '${isDiscount ? '-' : '+'}$percentage%',
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        Text(
          '${isDiscount ? '-' : '+'}\$${amount.toStringAsFixed(2)}',
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
