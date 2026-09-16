import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_gradient_button.dart';

class AppButton extends StatelessWidget {
  final Size size;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradientButton.primaryButton,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: size,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        icon: Icon(icon, size: 17),
      ),
    );
  }
}
