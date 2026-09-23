import 'package:flutter/material.dart';
import 'package:mini_store/state/app_provider.dart';

 class CartSnackBarHelper {
  static void show({
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 16,
        ),
        content: CartSnackBar(
          
        ),
      ),
    );
  }
}

  
class CartSnackBar extends StatelessWidget {
  
  const CartSnackBar({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final appState = AppProvider.of(context);
    
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.shopping_bag_outlined, color: theme.onPrimary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart (${appState.cartBadgeCount} items)',
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: theme.primary,
          ),
          onPressed:() {
             ScaffoldMessenger.of(context).clearSnackBars();
            Future.delayed(Duration(milliseconds: 150),() {
               appState.goCart();
            },);
          },
          child: Row(
            children: [
              Text('View', style: textTheme.labelMedium),
              Icon(Icons.arrow_forward, color: theme.onPrimary,size: 20,),
            ],
          ),
        ),
      ],
    );
  }
}
