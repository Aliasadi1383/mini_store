import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_button.dart';

class OrderSuccessDialog extends StatelessWidget {
  final VoidCallback continueShopping;
  const OrderSuccessDialog({super.key,required this.continueShopping});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      backgroundColor: theme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: Icon(
        Icons.check,
        size: 40,
        color: theme.tertiary.withValues(green: 0.8),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Order Successful!', style: textTheme.titleLarge),
          const SizedBox(height: 10),
          Text('Thank you for your purchase.', style: textTheme.titleLarge),
        ],
      ),
      actions: [
        AppButton(
          size: Size(double.infinity, 45),
          text: 'Continue Shopping',
          icon: Icons.shopping_bag_outlined,
          onPressed: continueShopping,
        ),
      ],
    );
  }
}
