import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_button.dart';

class CartSummary extends StatelessWidget {
  final int totalCartQuantity;
  final int numberCartItem;
  final double subTotal;
  final int discount;
  final double discountAmount;
  final int tax;
  final double taxAmount;
  final double totalAmount;
  const CartSummary({
    super.key,
    required this.totalCartQuantity,
    required this.numberCartItem,
    required this.subTotal,
    required this.discount,
    required this.discountAmount,
    required this.tax,
    required this.taxAmount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
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
                    '$totalCartQuantity items ($numberCartItem distinct products)',
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
                  '\$${subTotal.toStringAsFixed(2)}',
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
              '\$${totalAmount.toStringAsFixed(2)}',
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
