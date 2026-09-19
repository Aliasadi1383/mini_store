import 'package:flutter/material.dart';
import 'package:mini_store/widgets/app_gradient_button.dart';

class AppButton extends StatelessWidget {
  final Size size;
  final String text;
  final IconData icon;
  final IconData? endIcon;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme=Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: AppGradientButton.primaryButton,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(
          color: theme.primary.withValues(alpha: 0.3),
          offset: Offset(0, 4),
          blurRadius: 12,
        )],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: size,
          foregroundColor: theme.onPrimary,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 6),
            Text(text, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(width: 6),
            if (endIcon != null) Icon(endIcon),
          ],
        ),
      ),
    );
  }
}
