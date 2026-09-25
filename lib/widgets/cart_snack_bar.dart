import 'package:flutter/material.dart';
import 'package:mini_store/state/app_provider.dart';
import 'package:mini_store/state/app_state.dart';

class CartSnackBarHelper {
  static void show({
    required BuildContext context,
    VoidCallback? onView,
    required String title,
    required IconData icon
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
        content: CartSnackBar(
          appState: AppProvider.of(context),
          onView: onView,
          title: title,
          icon: icon,
        ),
      ),
    );
  }
}

class CartSnackBar extends StatelessWidget {
  final String title;
  final VoidCallback? onView;
  final AppState appState;
  final IconData icon;
  const CartSnackBar({
    super.key,
    required this.appState,
    this.onView,
    required this.title,
    required this.icon
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
          child: Icon(icon, color: theme.onPrimary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis ,
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
        if (onView!=null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              backgroundColor: theme.primary,
            ),
            onPressed: onView,
            child: Row(
              children: [
                Text('View', style: textTheme.labelMedium),
                Icon(Icons.arrow_forward, color: theme.onPrimary, size: 20),
              ],
            ),
          ),
      ],
    );
  }
}
